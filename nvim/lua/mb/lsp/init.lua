local lspconfig = require('lspconfig')
local nvim_status = require('lsp-status')

local has_completion, completion = pcall(require, 'lua.completion')

local telescope_mapper = require('mb.telescope.mappings')

local status = require('mb.lsp.status')

-- Can set this lower if needed.

-- require('vim.lsp.log').set_level("debug")
-- require('vim.lsp.log').set_level("trace")

-- Setup handlers before running
require('mb.lsp.handlers')

-- Turn on status.
-- status.activate()

-- local function map(key, vim_lsp_command)
--    local bufnr = 0
--    local mode = 'n'
--    local opts = { noremap=true, silent=true, nowait=true }

--    local cmd = '<cmd>lua ' .. vim_lsp_command .. '<CR>'

--    vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
-- end


local function map(mode, key, vim_lsp_command)
  local bufnr = 0
  local vim_lsp_command = vim_lsp_command or ""
  local opts = { noremap=true, silent=true, nowait=true }

  local cmd = '<cmd>lua ' .. vim_lsp_command .. '<CR>'

  vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
end

local custom_attach = function(client)
--   local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  if client.config.flags then
    -- It doesn't seem like clang likes this very much.
    if filetype ~= 'c' then
      client.config.flags.allow_incremental_sync = true
    end
  end

  if has_completion and filetype ~= 'c' then
    completion.on_attach(client)
  end

  -- status    .on_attach(client)

  map ('n', '<space>dn', 'vim.lsp.diagnostic.goto_next()')
  map ('n', '<space>dp', 'vim.lsp.diagnostic.goto_prev()')
  map ('n', '<space>sl', 'vim.lsp.diagnostic.show_line_diagnostics()')

  map ('n', '<c-]>', 'vim.lsp.buf.definition()')
  map ('n', 'gD', 'vim.lsp.buf.declaration()')

  map ('n', '<space>cr', 'MyLspRename()')

  telescope_mapper('gr', 'lsp_references', {
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    prompt_position = "top",
    ignore_filename = true,
  }, true)

  -- TODO: I don't like these combos
  telescope_mapper('<space>wd', 'lsp_document_symbols', { ignore_filename = true }, true)
  telescope_mapper('<space>ww', 'lsp_workspace_symbols', { ignore_filename = true }, true)
  if filetype == 'rust' then
    telescope_mapper('<space>wf', 'lsp_workspace_symbols', {
      ignore_filename = true,
      query = '#',
    }, true)
  end

  telescope_mapper('<space>ca', 'lsp_code_actions', nil, true)

  -- mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  -- mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')

  if filetype ~= 'lua' then
    map ('n', 'K', 'vim.lsp.buf.hover()')
  end

  map ('i', '<c-s>', 'vim.lsp.buf.signature_help()')
  map ('n', '<space>rr', 'vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd [[e]]')

  -- Rust is currently the only thing w/ inlay hints
  if filetype == 'rust' then
    vim.cmd(
      [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { ]]
        .. [[aligned = true, prefix = " » " ]]
      .. [[} ]]
    )
  end

  if vim.tbl_contains({"go", "rust"}, filetype) then
    vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
  end

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end


lspconfig.yamlls.setup {
  on_attach = custom_attach
}

lspconfig.clangd.setup {
    cmd = {
      "clangd-13",
      "--clang-tidy",
      "--all-scopes-completion",
      "--header-insertion=iwyu",
      "--background-index",
      "--suggest-missing-includes",
      "--cross-file-rename"
    },
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda"},
    on_attach = on_attach
  }

lspconfig.vimls.setup {
  on_attach = custom_attach,
}

local codelens_capabilities = vim.lsp.protocol.make_client_capabilities()
codelens_capabilities.textDocument.codeLens = {
  dynamicRegistration = false,
}

 --    I just keep it here to test w/ it.
  local custom_lsp_attach = function(client)
    -- See `:help nvim_buf_set_keymap()` for more information
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    -- ... and other keymappings for LSP

    -- Use LSP as the handler for omnifunc.
    --    See `:help omnifunc` and `:help ins-completion` for more information.
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- For plugins with an `on_attach` callback, call them here. For example:
    -- require('completion').on_attach(client)
  end

  -- An example of configuring for `sumneko_lua`,
  --  a language server for Lua.
  -- First, you must run `:LspInstall sumneko_lua` for this to work.
  -- require('lspconfig').sumneko_lua.setup({
  --   -- An example of settings for an LSP server.
  --   --    For more options, see nvim-lspconfig
  --   settings = {
  --     Lua = {
  --       diagnostics = {
  --         enable = true,
  --         globals = { "vim" },
  --       },
  --     }
  --   },

  --   on_attach = custom_lsp_attach
  -- })
  -- end

  -- LUA:
  local home = os.getenv ( "HOME" )

  local sumneko_lua_root_path =  home .. "/Repositories/language-servers/lua-language-server"

  require('lspconfig').sumneko_lua.setup({
    cmd = {
      sumneko_lua_root_path .. "/bin/macOS/lua-language-server",
      "-E",
      sumneko_lua_root_path .. "/main.lua"
    },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "map", "filter", "range", "reduce", "head", "tail", "nth", "describe", "it" },
          disable = {"redefined-local"}
        },
        runtime = {version = "LuaJIT"},
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            -- ['usr/local/bin/busted'] = true,
            --[require 'busted'(busted)] = true,
            -- [require 'busted.runner'({standalone = false})] = true,
            [require "nvim-treesitter.utils".get_package_path() .. "/lua"] = true,
          },
        },
      },
    },
    -- on_attach = custom_lsp_attach
    on_attach = custom_attach
  })
-- end

if true then
  lspconfig.tsserver.setup({
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx"
    },
    on_attach = custom_attach
  })
else
  lspconfig.sourcegraph_ts.setup {
    on_attach = custom_attach
  }
end

local sign_decider
if true then
  sign_decider = function(bufnr)
    local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
    -- No buffer local variable set, so just enable by default
    if not ok then
      return true
    end

    return result
  end
else
  -- LOL, alternate signs.
  sign_decider = coroutine.wrap(function()
    while true do
      coroutine.yield(true)
      coroutine.yield(false)
    end
  end)
end

--[[
0. nil -> do default (could be enabled or disabled)
1. false -> disable it
2. true -> enable, use defaults
3. table -> enable, with (some) overrides
4. function -> can return any of above
--]]

--[ An example of using functions...
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, method, params, client_id, bufnr, config)
--   local uri = params.uri
--
--   vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--       underline = true,
--       virtual_text = true,
--       signs = sign_decider,
--       update_in_insert = false,
--     }
--   )(err, method, params, client_id, bufnr, config)
--
--   bufnr = bufnr or vim.uri_to_bufnr(uri)
--
--   if bufnr == vim.api.nvim_get_current_buf() then
--     vim.lsp.diagnostic.set_loclist { open_loclist = false }
--   end
-- end
--]]
