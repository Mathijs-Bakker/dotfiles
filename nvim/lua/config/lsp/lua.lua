local util = require('lspconfig').lua_ls.setup {
  on_init = function(client)
    -- local path = client.workspace_folders[1].name
    -- local path = client.workspace_folders[1].name
    local path = vim.fn.stdpath 'data' .. 'mason/lua'
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        },
      })

      client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end
    return true
  end,
}
---- require('plugins.lsp-status').activate()
--require 'lsp-status'
---- local lsp_status = require 'plugins.lsp-status'

--local home = os.getenv 'HOME'

---- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

---- LUA:
---- path.concat { vim.fn.stdpath "data", "mason" }
---- local lua_ls_root_path = path.concat { vim.fn.stdpath 'data', 'mason', 'lua' }
--local lua_ls_root_path = home .. '/.local/share/nvim/mason/packages/lua-language-server'

--local lspconfig = require 'lspconfig'
--lspconfig.lua_ls.setup {
--  cmd = {
--      -- sumneko_lua_root_path .. '/bin/macOS/lua-language-server',
--  -- lua_ls_root_path .. '/lua-language-server',
--    '-E',
--    lua_ls_root_path .. '/main.lua',
--  },
--  commands = {
--    Format = {
--      function()
--        require('stylua-nvim').format_file()
--      end,
--    },
--  },
--  settings = {
--    Lua = {
--      completion = {
--        workspaceWord = false,
--        showWord = 'Disable',
--      },
--      diagnostics = {
--        globals = {
--          'vim',
--          'map',
--          'filter',
--          'range',
--          'reduce',
--          'head',
--          'tail',
--          'nth',
--          'describe',
--          'it',
--          'use',
--          'c',
--          'f',
--          'i',
--          'n',
--          's',
--          'sn',
--          't',
--        },
--        disable = { 'redefined-local' },
--      },
--      runtime = { version = 'LuaJIT' },
--      workspace = {
--        library = {
--          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
--          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
--          -- ['usr/local/bin/busted'] = true,
--          --[require 'busted'(busted)] = true,
--          -- [require 'busted.runner'({standalone = false})] = true,
--          --[require "nvim-treesitter.utils".get_package_path() .. "/lua"] = true,
--        },
--      },
--    },
--  },
--  on_attach = lsp_status.on_attach,

--  -- capabilities = lsp_status.capabilities
--  capabilities = capabilities,
--}
