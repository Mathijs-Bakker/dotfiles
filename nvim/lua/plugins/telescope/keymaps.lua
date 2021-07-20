if not pcall(require, 'telescope') then
  return
end

local function ts_map (key, picker_f)

  local rhs = string.format(":lua require'plugins.telescope.pickers'.%s()<CR>", picker_f)

  local opts = {
    noremap = true,
    silent = true
  }
  vim.api.nvim_set_keymap('n', key, rhs, opts)
  -- vim.api.nvim_buf_set_keymap(0, 'n', key, rhs, opts)
end

-- Navigation:
ts_map('<Leader>k', 'moveuo')

-- Lsp:
ts_map ('<Leader>cr', 'lsp_references')
ts_map ('<Leader>ca', 'lsp_code_actions')
ts_map ('<Leader>cd', 'lsp_definitions')
ts_map ('<Leader>ci', 'lsp_implementations')
ts_map ('<Leader>cd', 'lsp_document_symbols')
ts_map ('<Leader>cw', 'lsp_workspace_symbols')
ts_map ('<Leader>cD', 'lsp_diagnostics')

-- Files:
ts_map ('<Leader>ff', 'find_files')
ts_map ('<Leader>fg', 'git_files')
ts_map ('<Leader>fw', 'grep_word') -- Grep file in cwp
ts_map ('<Leader>fl', 'live_grep') -- Grep in files in cwp
ts_map ('<Leader>fe', 'file_browser')

-- NVim
ts_map ('<Leader>fd', 'dotfiles')
ts_map ('<Leader>fn', 'neovim_config')
ts_map ('<Leader>fb', 'buffers')
ts_map ('<Leader>fh', 'help_tags')

-- Git:
ts_map ('<Leader>fs', 'git_status')

-- Misc:
vim.api.nvim_set_keymap('n', '<Leader>fm', [[:lua require'telescope.builtin'.keymaps()<CR>]], {})
