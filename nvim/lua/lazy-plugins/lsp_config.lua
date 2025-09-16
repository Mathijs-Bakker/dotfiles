return {

  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp_lsp = require 'cmp_nvim_lsp'
    local keymaps = require 'config.lsp_on_attach'
    local capabilities =
      vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    local lspconfig = require 'lspconfig'
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = keymaps.on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
          },
        },
      },
    }

    lspconfig.superhtml.setup {
      capabilities = capabilities,
      on_attach = keymaps.on_attach,
      filetypes = { 'html' },
      cmd = { 'superhtml', '--stdio' },
      root_dir = require('lspconfig.util').root_pattern('.git', '.'),
    }

    require('lspconfig').clangd.setup { capabilities = capabilities, on_attach = keymaps.on_attach }
    require('lspconfig').jsonlsp.setup { capabilities = capabilities, on_attach = keymaps.on_attach }
    require('lspconfig').slint_lsp.setup { capabilities = capabilities, on_attach = keymaps.on_attach }

    require('lspconfig').gdscript.setup {
      capabilities = capabilities,
      on_attach = keymaps.on_attach,
    }
  end,
}
