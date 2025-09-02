if not pcall(require, 'telescope') then
  return
end

local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

-- Custom 'q' function
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

-- Telescope setup
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['q'] = close_if_empty, -- insert mode mapping
      },
      n = {
        ['q'] = actions.close, -- normal mode mapping
      },
    },
  },
}
function ts_map(key, picker_f)
  local rhs = string.format(":lua require'config.telescope.pickers'.%s()<CR>", picker_f)

  local opts = {
    noremap = true,
    silent = true,
  }
  vim.api.nvim_set_keymap('n', key, rhs, opts)
  -- vim.api.nvim_buf_set_keymap(0, 'n', key, rhs, opts)
end

-- Navigation:
-- ts_map('<Leader>k', 'moveuo')

-- Lsp:
ts_map('<Leader>lr', 'lsp_references') -- List References
-- ts_map('<Leader>ca', 'lsp_code_actions')
-- vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})
-- vim.keymap.set("n", "<Leader>cca", vim.lsp.buf.range_code_action, {}) <-- Deprecated

ts_map('<Leader>cd', 'lsp_definitions')
ts_map('<Leader>ci', 'lsp_implementations')
ts_map('<Leader>cd', 'lsp_document_symbols')
ts_map('<Leader>cw', 'lsp_workspace_symbols')
-- ts_map('<Leader>cD', 'lsp_diagnostics')
ts_map('<Leader>ld', 'lsp_diagnostics')

Nnoremap('gt', [[:lua require('telescope.builtin').lsp_type_definitions()<CR>]])

-- Files:
ts_map('<Leader>ff', 'find_files')
ts_map('<Leader>fr', 'find_recent')
ts_map('<Leader>fg', 'git_files')
ts_map('<Leader>fw', 'grep_word') -- Grep file in cwp
ts_map('<Leader>fl', 'live_grep') -- Grep in files in cwp
ts_map('<Leader>fe', 'file_browser')

-- NVim
ts_map('<Leader>fd', 'dotfiles')
ts_map('<Leader>fn', 'neovim_config')
ts_map('<Leader>fb', 'buffers')
ts_map('<Leader>fh', 'help_tags')

-- Git:
ts_map('<Leader>fs', 'git_status')

-- Misc:
vim.api.nvim_set_keymap('n', '<Leader>fm', [[:lua require'telescope.builtin'.keymaps()<CR>]], {})
