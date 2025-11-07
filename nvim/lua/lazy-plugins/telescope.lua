return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.1.9',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'

    local function close_if_empty(prompt_bufnr)
      local prompt = action_state.get_current_line()
      if prompt == '' then
        actions.close(prompt_bufnr)
      else
        -- insert a literal 'q' if the prompt is not empty
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()
        vim.api.nvim_set_current_line(line:sub(1, col) .. 'q' .. line:sub(col + 1))
        vim.api.nvim_win_set_cursor(0, { row, col + 1 })
      end
    end

    local function neovim_config()
      require('telescope.builtin').find_files {
        prompt_title = '   Neovim RC    ',
        cwd = '~/.dotfiles/nvim/',
        layout_strategy = 'flex',
        layout_config = {
          horizontal = {
            -- preview_width = 120,
          },
          vertical = {
            -- preview_height = 0.75,
          },
          preview_cutoff = 20,
        },
      }
    end

    local function dotfiles()
      require('telescope.builtin').find_files {
        prompt_title = '   Dotfiles   ',
        cwd = '~/.dotfiles/',
        layout_strategy = 'flex',
      }
    end

    require('telescope').setup {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            ['q'] = close_if_empty, -- insert mode mapping
          },
          n = {
            ['q'] = actions.close, -- normal mode mapping
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      },
    }

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent' })
    vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = 'Telescope keymaps' })
    vim.keymap.set('n', '<leader>fd', dotfiles, { desc = 'Telescope dotfiles' })
    vim.keymap.set('n', '<leader>fn', neovim_config, { desc = 'Telescope Neovim config' })
  end,
}
