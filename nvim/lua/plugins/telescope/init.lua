if not pcall(require, 'telescope') then
  return
end

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = '> ',
    selection_caret = '> ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        preview_width = 0.6,
      },
      vertical = {
        preview_height = 0.3,
      },
      preview_cutoff = 30,
      prompt_position = 'bottom',
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    extensions = {
      fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },

      fzf_writer = {
        use_highlighter = false,
        minimum_grep_characters = 6,
      },
      frecency = {
        db_root = '~/.local/share/nvim/db_root',
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = { '*.git/*', '*/tmp/*' },
        disable_devicons = false,
        workspaces = {
          -- TODO: Need to investigate this further:
          ['conf'] = '~/.config',
          ['data'] = '~/.local/share',
          -- ['project'] = '~/projects',
          ['repo'] = '~/Repositories',
          ['docs'] = '~/Documents',
          -- ['wiki'] = '/home/my_username/wiki',
        },
      },
    },
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
  },
}

TrySource 'plugins.telescope.pickers'
TrySource 'plugins.telescope.keymaps'
