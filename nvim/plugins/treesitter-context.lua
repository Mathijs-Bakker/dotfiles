return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = true,
  -- event = 'LazyFile',
  opts = {
    mode = 'cursor',
    max_lines = 0,
  },
  -- keys = {
  --   {
  --     '<leader>cx',
  --     function()
  --       local tsc = require 'treesitter-context'
  --       tsc.toggle()
  --     end,
  --     desc = 'Toggle Treesitter Context',
  --   },
  -- },
}
