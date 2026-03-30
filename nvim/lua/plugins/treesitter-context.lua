return {
  'nvim-treesitter/nvim-treesitter-context',
  main = 'treesitter-context',
  enabled = true,
  opts = {
    mode = 'cursor',
    max_lines = 0,
    separator = '-',
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
