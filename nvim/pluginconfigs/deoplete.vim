let g:deoplete#enable_at_startup = 1

" enable_logging
call deoplete#custom#option('profile', v:true)
call deoplete#enable_logging('DEBUG', 'deoplete.log')
call deoplete#custom#source('cs', 'is_debug_enabled', 1)

"=============================================================================
" Sources:
"-----------------------------------------------------------------------------

"call deoplete#custom#option('sources', {
"    \ 'cs': ['omni', 'tabnine'],
"    \ })
"call deoplete#custom#source('omni', 'rank', 2000)

"call deoplete#custom#var('omni', 'input_patterns', {
"    \ 'cs': '\w+|[^. *\t]\.\w*',
"    \})
call deoplete#custom#option('sources', {
   \ 'cs': ['omnisharp'],
   \})   

call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 5,
\ })

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" ----------------------------------------------------------------------------
" Options:
" ----------------------------------------------------------------------------

" Auto or manual completion
"call deoplete#custom#option('auto_complete', v:true)

" Delay completion after input (default 0 milliseconds:
"call deoplete#custom#option('auto_complete_delay', 200)

"call deoplete#custom#option('auto_complete_popup', "auto")
" Ignore upper- and lowercase in input
"call deoplete#custom#option('smart_case', v:true)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" autocmd VimEnter * inoremap <expr> <cr> ((pumvisible()) ? (deoplete#close_popup()) : ("\<cr>"))
