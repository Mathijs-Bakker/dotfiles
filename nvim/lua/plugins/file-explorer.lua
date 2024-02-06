return {
  'stevearc/oil.nvim',
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
  opts = {
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
