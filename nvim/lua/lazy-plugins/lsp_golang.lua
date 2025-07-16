return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'gopls' },
      }

      local lspconfig = require 'lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      local opts = {
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
          end
        end,
        capabilities = cmp_nvim_lsp.default_capabilities(),
      }

      lspconfig.gopls.setup(vim.tbl_extend('force', {
        settings = {
          gopls = {
            -- gofumpt = true, -- enable stricter formatting
            -- formatTool = 'goimports', -- not officially supported; implicit by PATH
            hints = {
              parameterHints = true,
              compositeLiteralFields = true,
              rangeVariableTypes = true,
              assignVariableTypes = true,
            },
            analyses = {
              unusedparams = true,
              unparam = true,
            },
            usePlaceholders = true,
            staticcheck = true,
          },
        },
      }, opts))

      -- vim.api.nvim_create_autocmd('FileType', {
      --   pattern = 'go',
      --   callback = function()
      --     vim.bo.expandtab = false -- use real tabs
      --     vim.bo.tabstop = 8 -- display tabs as 8 spaces wide
      --     vim.bo.softtabstop = 8
      --     vim.bo.shiftwidth = 8 -- how much to indent/unindent
      --   end,
      -- })
    end,
  },
}
