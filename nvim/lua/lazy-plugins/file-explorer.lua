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
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
}
-- return {
--   'echasnovski/mini.files',
--   keys = {
--     {
--       '-',
--       function()
--         require('mini.files').open()
--       end,
--       desc = 'Open MiniFiles',
--     },
--   },
--   config = function()
--     local original_set_lines = vim.api.nvim_buf_set_lines

--     local filter_godot_files = function(lines)
--       local filtered = {}
--       local godot_patterns = {
--         '%.uid[/]?$', -- .uid files
--         '%.import[/]?$', -- .import files
--         '^%.godot[/]?$', -- .godot directory
--         '^%.mono[/]?$', -- .mono directory
--         'godot.*%.tmp$', -- godot temp files
--       }

--       for _, line in ipairs(lines) do
--         local should_include = true
--         for _, pattern in ipairs(godot_patterns) do
--           if line:match(pattern) then
--             should_include = false
--             break
--           end
--         end
--         if should_include then
--           table.insert(filtered, line)
--         end
--       end
--       return filtered
--     end

--     require('mini.files').setup {
--       content = {
--         filter = function(fs_entry)
--           return true
--         end, -- Use our custom filtering instead
--       },
--       mappings = {
--         close = 'q',
--         go_in = 'l',
--         go_in_plus = 'L',
--         go_out = 'h',
--         go_out_plus = 'H',
--         reset = '<BS>',
--         reveal_cwd = '@',
--         show_help = 'g?',
--         synchronize = '=',
--         trim_left = '<',
--         trim_right = '>',
--       },
--       options = {
--         permanent_delete = true,
--         use_as_default_explorer = true,
--       },
--       windows = {
--         max_number = math.huge,
--         preview = false,
--         width_focus = 50,
--         width_nofocus = 15,
--         width_preview = 25,
--       },
--     }

--     vim.api.nvim_buf_set_lines = function(buf_id, start, end_idx, strict_indexing, lines)
--       local bufname = vim.api.nvim_buf_get_name(buf_id)
--       if bufname:match 'minifiles://' and type(lines) == 'table' then
--         lines = filter_godot_files(lines)
--       end
--       return original_set_lines(buf_id, start, end_idx, strict_indexing, lines)
--     end
--   end,
-- }
