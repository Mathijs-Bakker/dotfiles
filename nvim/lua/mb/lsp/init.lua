local has_lsp, lspconfig = pcall(require, 'lspconfig')
if not has_lsp then
  return
end

local nvim_status = require('lsp-status')

local telescope_mapper = require('mb.telescope.mappings')

-- TODO: Consider using this. I do kind of like it :)
local nnoremap = vim.keymap.nnoremap

-- Can set this lower if needed.
-- require('vim.lsp.log').set_level("debug")
-- require('vim.lsp.log').set_level("trace")

_ = require('lspkind').init()

_ = require('mb.lsp.status')
require('mb.lsp.handlers')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

-- Turn on status.
-- status.activate()


local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  if client.config.flags then
    -- It doesn't seem like clang likes this very much.
    if filetype ~= 'c' then
      client.config.flags.allow_incremental_sync = true
    end
  end

  -- status    .on_attach(client)

  nnoremap { '<space>dn', vim.lsp.diagnostic.goto_next, buffer = 0 }
  nnoremap { '<space>dp', vim.lsp.diagnostic.goto_prev, buffer = 0 }
  nnoremap { '<space>sl', vim.lsp.diagnostic.show_line_diagnostics, buffer = 0 }

  nnoremap { '<c-]>', vim.lsp.buf.definition, buffer = 0 }
  nnoremap { 'gD', vim.lsp.buf.declaration, buffer = 0 }

  mapper('n', '<space>cr', 'MyLspRename()')

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
    mapper('n', 'K', 'vim.lsp.buf.hover()')
  end

  mapper('i', '<c-s>', 'vim.lsp.buf.signature_help()')
  mapper('n', '<space>rr', 'vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd [[e]]')

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

lspconfig.pyls.setup {
  enable = true,
  plugins = {
    pyls_mypy = {
      enabled = true,
      live_mode = false
    }
  },
  on_attach = custom_attach
}

lspconfig.vimls.setup {
  on_attach = custom_attach,
}

local codelens_capabilities = vim.lsp.protocol.make_client_capabilities()
codelens_capabilities.textDocument.codeLens = {
  dynamicRegistration = false,
}

lspconfig.gopls.setup {
  on_attach = custom_attach,

  capabilities = codelens_capabilities,

  settings = {
    gopls = {
      codelenses = { test = true },
    }
  }
}

lspconfig.gdscript.setup {
  on_attach = custom_attach,
}

-- Load lua configuration from nlua.
if true then
  require('nlua.lsp.nvim').setup(lspconfig, {
    on_attach = custom_attach,

    globals = {
      -- Colorbuddy
      "Color", "c", "Group", "g", "s",

      -- Custom
      "RELOAD",
    }
  })
else
  -- This is the documentation example from ":help".
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
  require('lspconfig').sumneko_lua.setup({
    -- An example of settings for an LSP server.
    --    For more options, see nvim-lspconfig
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { "vim" },
        },
      }
    },

    on_attach = custom_lsp_attach
  })
end

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


lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
  on_attach = custom_attach,

  -- Required for lsp-status
  init_options = {
    clangdFileStatus = true
  },
  handlers = nvim_status.extensions.clangd.setup(),
  capabilities = nvim_status.capabilities,
})

if 1 == vim.fn.executable('cmake-language-server') then
  lspconfig.cmake.setup {
    on_attach = custom_attach,
  }
end

lspconfig.rust_analyzer.setup({
  cmd = {"rust-analyzer"},
  filetypes = {"rust"},
  on_attach = custom_attach,
})

--[[
Example settings, have not messed around with too many of these.
-- require 'lspconfig'.pyls_ms.setup{
--     init_options = {
--         interpreter = {
--             properties = {
--                 InterpreterPath = "~/.pyenv/versions/sourceress/bin/python",
--                 Version = "3.6"
--             }
--         }
--     }
-- }
let settings = {
\   "pyls" : {
\     "enable" : v:true,
\     "trace" : { "server" : "verbose", },
\     "commandPath" : "",
\     "configurationSources" : [ "pycodestyle" ],
\     "plugins" : {
\       "jedi_completion" : { "enabled" : v:true, },
\       "jedi_hover" : { "enabled" : v:true, },
\       "jedi_references" : { "enabled" : v:true, },
\       "jedi_signature_help" : { "enabled" : v:true, },
\       "jedi_symbols" : {
\         "enabled" : v:true,
\         "all_scopes" : v:true,
\       },
\       "mccabe" : {
\         "enabled" : v:true,
\         "threshold" : 15,
\       },
\       "preload" : { "enabled" : v:true, },
\       "pycodestyle" : { "enabled" : v:true, },
\       "pydocstyle" : {
\         "enabled" : v:false,
\         "match" : "(?!test_).*\\.py",
\         "matchDir" : "[^\\.].*",
\       },
\       "pyflakes" : { "enabled" : v:true, },
\       "rope_completion" : { "enabled" : v:true, },
\       "yapf" : { "enabled" : v:true, },
\     }}}
--]]

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
