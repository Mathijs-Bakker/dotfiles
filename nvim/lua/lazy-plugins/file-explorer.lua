-- return {
--   'stevearc/oil.nvim',
--   keys = {
--     { '-' '<CMD>Oil<CR>', desc = 'Open parent directory' },
--   },
--   opts = {
--     view_options = {
--       -- Show files and directories that start with "."
--       show_hidden = true,
--     },
--   },
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
-- }
return {
  'echasnovski/mini.files',
  version = false,

  vim.keymap.set('n', '-', function()
    require('mini.files').open()
  end),

  config = function()
    require('fidget').setup {
      -- Customization of shown content
      content = {
        -- Predicate for which file system entries to show
        filter = nil,
        -- What prefix to show to the left of file system entry
        prefix = nil,
        -- In which order to show file system entries
        sort = nil,
      },

      -- Module mappings created only inside explorer.
      -- Use `''` (empty string) to not create one.
      mappings = {
        -- close = 'q',
        close = '<Esc>',
        go_in = 'l',
        go_in_plus = 'L',
        go_out = 'h',
        go_out_plus = 'H',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },

      -- General options
      options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = true,
      },

      -- Customization of explorer windows
      windows = {
        -- Maximum number of windows to show side by side
        max_number = math.huge,
        -- Whether to show preview of file/directory under cursor
        preview = false,
        -- Width of focused window
        width_focus = 50,
        -- Width of non-focused window
        width_nofocus = 15,
        -- Width of preview window
        width_preview = 25,
      },
    }
  end,
}
