-- local actions = require('telescope.actions')
local action_state = require 'telescope.actions.state'
-- local sorters = require('telescope.sorters')
local themes = require 'telescope.themes'

local M = {}

--[[ Files: ]]
--

function M.find_files()
  require('telescope.builtin').find_files {
    prompt_title = ' Find Files ',
  }
end

function M.find_recent()
  -- require('telescope').extensions.frecency(themes.get_ivy {})
  require('telescope').extensions.frecency.frecency(themes.get_ivy {})
end

function M.git_files()
  require('telescope.builtin').git_files {
    prompt_title = ' Git Files ',
  }
end

function M.grep_string()
  require('telescope.builtin').grep_string {
    prompt_title = ' Grep String ',
  }
end

function M.live_grep()
  -- require('telescope.builtin').live_grep {}

  require('telescope').extensions.fzf_writer.staged_grep {
    prompt_title = ' Live Grep ',
    path_display = { 'absolute' },
    previewer = false,
    fzf_separator = '|>',
  }
end

function M.file_browser()
  local opts

  opts = {
    prompt_title = ' File Brower ',
    sorting_strategy = 'ascending',
    scroll_strategy = 'cycle',
    layout_config = {
      prompt_position = 'top',
    },

    attach_mappings = function(prompt_bufnr, map)
      local current_picker = action_state.get_current_picker(prompt_bufnr)

      local modify_cwd = function(new_cwd)
        current_picker.cwd = new_cwd
        current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
      end

      map('i', '-', function()
        modify_cwd(current_picker.cwd .. '/..')
      end)
      map('i', '~', function()
        modify_cwd(vim.fn.expand '~')
      end)

      local modify_depth = function(mod)
        return function()
          opts.depth = opts.depth + mod

          local current_picker = action_state.get_current_picker(prompt_bufnr)
          current_picker:refresh(opts.new_finder(current_picker.cwd), {
            reset_prompt = true,
          })
        end
      end

      map('i', '<M-=>', modify_depth(1))
      map('i', '<M-+>', modify_depth(-1))

      return true
    end,
  }

  require('telescope.builtin').file_browser(opts)
end

--[[ Search for files ]]
--

--[[ In files: ]]
--

function M.grep_word()
  require('telescope.builtin').grep_string {
    prompt_title = ' Grep Word ',
    path_display = { 'absolute' },
    word_match = '-w',
    only_sort_text = true,
    layout_strategy = 'vertical',
  }
end

-- end files

--[[ LSP: ]]
--

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
  }

  require('telescope.builtin').lsp_code_actions(opts)
end

function M.lsp_references()
  require('telescope.builtin').lsp_references()
end

function M.lsp_definitions()
  require('telescope.builtin').lsp_definitions()
end

function M.lsp_implementations()
  require('telescope.builtin').lsp_implementations()
end

function M.lsp_document_symbols()
  require('telescope.builtin').lsp_document_symbols()
end

function M.lsp_workspace_symbols()
  require('telescope.builtin').lsp_workspace_symbols()
end

function M.lsp_diagnostics()
  local opts = {
    prompt_title = ' LSP Workspace Diagnostics ',
    layout_strategy = 'vertical',
    vertical = {
      height = 1,
      -- preview_cutoff = 20,
      preview_height = 6,
      prompt_position = 'bottom',
      width = 0.8,
    },
  }
  require('telescope.builtin').diagnostics(opts)
end

--[[ Nvim ]]
--

function M.neovim_config()
  require('telescope.builtin').find_files {
    prompt_title = ' Neovim RC ',
    cwd = '~/.dotfiles/nvim/',
    layout_strategy = 'flex',
    layout_config = {
      horizontal = {
        -- preview_width = 120,
      },
      vertical = {
        -- preview_height = 0.75,
      },
    },
  }
end

function M.dotfiles()
  require('telescope.builtin').find_files {
    prompt_title = ' Dotfiles ',
    cwd = '~/.dotfiles/',
    layout_strategy = 'flex',
  }
end

function M.buffers()
  require('telescope.builtin').buffers {
    prompt_title = ' Buffers ',
  }
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    prompt_title = ' Help Tags ',
    show_version = true,
  }
end

-- end nvim
function M.git_status()
  local opts = themes.get_dropdown {
    prompt_title = ' Git Status ',
    winblend = 10,
    border = true,
    previewer = false,
    git_icons = {
      changed = 'M',
    },
  }
  require('telescope.builtin').git_status(opts)
end

-- LSP / Diagnostics
local function lsp_references()
  require('telescope.builtin').lsp_references {
    layout_strategy = 'vertical',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    ignore_filename = false,
  }
end

function lsp_implementations()
  require('telescope.builtin').lsp_implementations {
    layout_strategy = 'vertical',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    ignore_filename = false,
  }
end

function lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require('telescope.builtin').lsp_code_actions(opts)
end
-- end LSP / Diagnostics
return M
