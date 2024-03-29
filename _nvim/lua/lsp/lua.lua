require('plugins.lsp-status').activate()
local lsp_status = require 'plugins.lsp-status'

local home = os.getenv 'HOME'

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- LUA:
local lua_ls_root_path = home .. '/.local/share/nvim/mason/packages/lua-language-server'

local lspconfig = require 'lspconfig'
lspconfig.lua_ls.setup {
  cmd = {
    -- sumneko_lua_root_path .. '/bin/macOS/lua-language-server',
    lua_ls_root_path .. '/lua-language-server',
    '-E',
    lua_ls_root_path .. '/main.lua',
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
      completion = {
        workspaceWord = false,
        showWord = 'Disable',
      },
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
          'c',
          'f',
          'i',
          'n',
          's',
          'sn',
          't',
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
