" Telescope: {{{
    nnoremap <Leader>p <cmd>lua require'telescope.builtin'.git_files{}<CR>
    " nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
    " nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
    nnoremap <Leader>en <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>

    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" }}}
