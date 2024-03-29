if not pcall(require, 'telescope') then
  return
end

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
