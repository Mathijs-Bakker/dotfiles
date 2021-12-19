require('plugins.lsp-status').activate()
local lsp_status = require 'plugins.lsp-status'

local home = os.getenv 'HOME'

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- LUA:
local sumneko_lua_root_path = home .. '/Repositories/language-servers/lua-language-server'

require('lspconfig').sumneko_lua.setup {
  cmd = {
    sumneko_lua_root_path .. '/bin/macOS/lua-language-server',
    '-E',
    sumneko_lua_root_path .. '/main.lua',
  },
  commands = {
    Format = {
      function()
        require('stylua-nvim').format_file()
      end,
    },
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'map',
          'filter',
          'range',
          'reduce',
          'head',
          'tail',
          'nth',
          'describe',
          'it',
          'use',
        },
        disable = { 'redefined-local' },
      },
      runtime = { version = 'LuaJIT' },
      workspace = {
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
          -- ['usr/local/bin/busted'] = true,
          --[require 'busted'(busted)] = true,
          -- [require 'busted.runner'({standalone = false})] = true,
          --[require "nvim-treesitter.utils".get_package_path() .. "/lua"] = true,
        },
      },
    },
  },
  on_attach = lsp_status.on_attach,
  -- capabilities = lsp_status.capabilities
  capabilities = capabilities,
}
