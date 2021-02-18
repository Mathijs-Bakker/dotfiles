" Telescope: {{{
    nnoremap <Leader>p <cmd>lua require'telescope.builtin'.git_files{}<CR>
    " Files:
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    " Grep:
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    " Buffers:
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    " Help Tags: 
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
    " Vim Config:
    nnoremap <Leader>fc <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
" }}}
