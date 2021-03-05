" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c



" let g:completion_enable_auto_popup = 0
" map <c-p> to manually trigger completion
        " imap <silent> <c-p> <Plug>(completion_trigger)
"
        " Or you want to use <tab> to trigger completion without modifying the
        " usage to <tab> keys.
"
    " imap <tab> <Plug>(completion_smart_tab)
    " imap <s-tab> <Plug>(completion_smart_s_tab)

let g:completion_enable_snippet = "UltiSnips"
" let g:completion_confirm_key  = "\<CR>"
" let g:completion_enable_auto_hover = 1
" let g:completion_enable_auto_signature  = 1
" let g:completion_enable_auto_paren = 1

let g:completion_trigger_on_delete = 1

let g:completion_chain_complete_list = {
	    \'default' : [
	    \    {'complete_items': ['lsp', 'snippet', 'path']},
	    \    {'mode': '<c-p>'},
	    \    {'mode': '<c-n>'}
	    \]
	    \}

let g:completion_menu_length = 10
