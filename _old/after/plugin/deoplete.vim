if !exists('g:loaded_deoplete')
  finish
endif

" let g:deoplete#enable_at_startup = 1

" Enable Deoplete logging {{{

  "call deoplete#custom#option('profile', v:true)
  "call deoplete#enable_logging('DEBUG', 'deoplete.log')
  "call deoplete#custom#source('cs', 'is_debug_enabled', 1)

" }}}

" Options: {{{
    call deoplete#custom#option({
    \   'auto_complete_delay': 100,
    \   'smart_case': v:false,
    \   'ignore_case': v:true,
    \ })
" }}}

" Custom Source: {{{

  " Rank: {{{
      call deoplete#custom#source('ultisnips', 'rank', 700)
      call deoplete#custom#source('omnisharp', 'rank', 600)
      call deoplete#custom#source('tabnine', 'rank', 500)
  "}}}

  " Mark: {{{

      " Tweaks for a cleaner appearance. Only lanuages are shown (c#, JS, LUA)
      " There's space for four characters to keep the output aligned.
      " Hide the marks by setting a string with four spaces.

      call deoplete#custom#source('omnisharp', 'mark', ' C# ')
      call deoplete#custom#source('jedi', 'mark', ' PY ')

      " Ultisnips shows 'snippet' already in the output. Mark can be empty.
      call deoplete#custom#source('ultisnips', 'mark', '    ')

      " Tabnine outputs a percentage, which makes clear it's TN completion.
      call deoplete#custom#source('tabnine', 'mark', '    ')

  " Variable: {{{
  "
      call deoplete#custom#var('tabnine', {
      \     'line_limit': 500,
      \     'max_num_results': 5,
      \})
  " }}}

" }}}

" Key mappings: {{{

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" }}}
