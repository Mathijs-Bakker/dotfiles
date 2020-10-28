" Telescope: {{{
    nnoremap <Leader>p <cmd>lua require'telescope.builtin'.git_files{}<CR>
    " nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
    " nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
    nnoremap <Leader>en <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
" }}}
