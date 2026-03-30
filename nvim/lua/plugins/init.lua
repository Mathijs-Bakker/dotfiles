local M = {}

local function read_plugin_modules()
  local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
  local modules = {}

  for _, path in ipairs(vim.fn.globpath(plugin_dir, '**/*.lua', false, true)) do
    local relative = path:sub(#plugin_dir + 2)
    if relative ~= 'init.lua' then
      table.insert(modules, 'plugins.' .. relative:gsub('%.lua$', ''):gsub('/', '.'))
    end
  end

  table.sort(modules)
  return modules
end

local function as_list(value)
  if value == nil then
    return {}
  end

  if value[1] == nil and value.src == nil and value.dir == nil and value.url == nil then
    return { value }
  end

  return value
end

function M.all()
  local specs = {}

  for _, module_name in ipairs(read_plugin_modules()) do
    local module_specs = as_list(require(module_name))
    for _, spec in ipairs(module_specs) do
      table.insert(specs, spec)
    end
  end

  return specs
end

return M
