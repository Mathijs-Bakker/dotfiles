local M = {}

local function normalize_src(spec)
  if spec.src then
    return spec.src
  end

  if spec.dir then
    return vim.fn.expand(spec.dir)
  end

  if spec.url then
    return spec.url
  end

  if type(spec[1]) == 'string' then
    if spec[1]:match '^[%w_.-]+/[%w_.-]+$' then
      return 'https://github.com/' .. spec[1]
    end

    return spec[1]
  end

  error('Plugin spec is missing a source')
end

local function normalize_name(spec, src)
  if spec.name and spec.name ~= '' then
    return spec.name
  end

  local name = src:gsub('/+$', ''):match '([^/]+)$' or src
  return (name:gsub('%.git$', ''))
end

local function normalize_main(spec, name)
  if spec.main then
    return spec.main
  end

  return name:gsub('%.nvim$', ''):gsub('^nvim%-', '')
end

local function normalize_version(spec)
  return spec.version or spec.tag or spec.branch or spec.commit
end

local function flatten_deps(deps, register)
  local names = {}

  if not deps then
    return names
  end

  local dep_list = type(deps) == 'table' and deps or { deps }

  for _, dep in ipairs(dep_list) do
    local dep_name = register(dep)
    if dep_name then
      table.insert(names, dep_name)
    end
  end

  return names
end

local function collect_specs()
  local plugin_modules = require('plugins').all()
  local specs = {}
  local order = {}

  local function register(raw)
    if raw == nil then
      return nil
    end

    if type(raw) == 'string' then
      raw = { raw }
    end

    if raw[1] == nil and raw.src == nil and raw.dir == nil and raw.url == nil then
      local nested_names = {}
      for _, nested in ipairs(raw) do
        local nested_name = register(nested)
        if nested_name then
          table.insert(nested_names, nested_name)
        end
      end

      return nested_names[1]
    end

    local enabled = raw.enabled
    if enabled == nil then
      enabled = raw.enable
    end

    if enabled == false then
      return nil
    end

    local src = normalize_src(raw)
    local name = normalize_name(raw, src)
    local existing = specs[name]

    if existing then
      return name
    end

    local spec = vim.tbl_deep_extend('force', {}, raw, {
      src = src,
      name = name,
      main = normalize_main(raw, name),
      version = normalize_version(raw),
    })

    spec.dependencies = flatten_deps(raw.dependencies, register)
    specs[name] = spec
    table.insert(order, name)
    return name
  end

  for _, module_spec in ipairs(plugin_modules) do
    register(module_spec)
  end

  return specs, order
end

local function setup_build_hooks(specs)
  local group = vim.api.nvim_create_augroup('packinit-build-hooks', { clear = true })

  vim.api.nvim_create_autocmd('PackChanged', {
    group = group,
    callback = function(ev)
      local spec = specs[ev.data.spec.name]
      if not spec or not spec.build then
        return
      end

      if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then
        return
      end

      if type(spec.build) ~= 'string' then
        return
      end

      if spec.build:sub(1, 1) == ':' then
        vim.cmd.packadd(spec.name)
        vim.cmd(spec.build:sub(2))
        return
      end

      vim.system({ vim.o.shell, '-lc', spec.build }, { cwd = ev.data.path }, function(result)
        if result.code == 0 then
          return
        end

        vim.schedule(function()
          vim.notify(
            ('Build failed for %s:\n%s'):format(spec.name, result.stderr or ''),
            vim.log.levels.ERROR
          )
        end)
      end)
    end,
  })
end

local function call_setup(spec)
  if spec.config then
    spec.config(spec, spec.opts)
    return
  end

  if spec.opts == nil then
    return
  end

  local ok, plugin = pcall(require, spec.main)
  if not ok then
    error(('Failed to require %s for %s'):format(spec.main, spec.name))
  end

  if type(plugin.setup) ~= 'function' then
    error(('Plugin %s does not expose setup() via %s'):format(spec.name, spec.main))
  end

  plugin.setup(spec.opts)
end

function M.setup()
  if vim.pack == nil then
    vim.notify('This config now requires Neovim 0.12+ with vim.pack', vim.log.levels.ERROR)
    return false
  end

  local specs, order = collect_specs()
  setup_build_hooks(specs)

  if vim.fn.exists ':PackUpdate' == 0 then
    vim.api.nvim_create_user_command('PackUpdate', function()
      vim.pack.update()
    end, { desc = 'Update plugins managed by vim.pack' })
  end

  local pack_specs = {}
  for _, name in ipairs(order) do
    local spec = specs[name]
    table.insert(pack_specs, {
      src = spec.src,
      name = spec.name,
      version = spec.version,
    })
  end

  vim.pack.add(pack_specs, { confirm = false, load = false })

  for _, name in ipairs(order) do
    local spec = specs[name]
    if spec.init then
      spec.init(spec)
    end
  end

  local configured = {}

  local function load(name)
    if configured[name] then
      return
    end

    local spec = specs[name]
    if not spec then
      return
    end

    for _, dep_name in ipairs(spec.dependencies or {}) do
      load(dep_name)
    end

    vim.cmd.packadd(spec.name)
    call_setup(spec)
    configured[name] = true
  end

  for _, name in ipairs(order) do
    load(name)
  end

  return true
end

return M
