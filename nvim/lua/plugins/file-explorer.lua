return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ['h'] = { '<CMD>Oil<CR>', desc = 'Open parent directory' },
      ['l'] = 'actions.select',
      ['q'] = { 'actions.close', mode = 'n' },
    },
    default_file_explorer = true,
    view_options = {
      show_hidden = false, -- dotfiles off by default
      is_hidden_file = function(name, _)
        local godot_patterns = {
          '%.uid[/]?$', -- .uid files
          '%.import[/]?$', -- .import files
          '^%.godot[/]?$', -- .godot directory
          '^%.mono[/]?$', -- .mono directory
          'godot.*%.tmp$', -- godot temp files
        }
        for _, pat in ipairs(godot_patterns) do
          if name:match(pat) then
            return true
          end
        end
        return false
      end,
    },
  },
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
}
