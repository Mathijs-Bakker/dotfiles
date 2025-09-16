return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false,
  ft = { 'rust' },

  -- config = function()
  --   local keymaps = require 'config.lsp_on_attach'

  --   settings = {
  --     ['rust-analyzer'] = {
  --       server = {
  --         trace = {
  --           server = { 'verbose' },
  --         },
  --       },
  --     },
  --   }
  -- end,
}
