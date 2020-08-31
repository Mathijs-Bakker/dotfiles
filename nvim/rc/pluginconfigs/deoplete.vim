let g:deoplete#enable_at_startup = 1

" Enable Deoplete logging {{{

  "call deoplete#custom#option('profile', v:true)
  "call deoplete#enable_logging('DEBUG', 'deoplete.log')
  "call deoplete#custom#source('cs', 'is_debug_enabled', 1)

" }}}

" Custom Source: {{{

  " Rank: {{{
      call deoplete#custom#source('ultisnips', 'rank', 3)
      call deoplete#custom#source('omnisharp', 'rank', 2)
      call deoplete#custom#source('tabnine', 'rank', 1)
  "}}}

  " Mark: {{{
      " Hide the marks by setting a string with four spaces.
      " Probably there's a better option for this.
      call deoplete#custom#source('omnisharp', 'mark', '    ')
      call deoplete#custom#source('ultisnips', 'mark', '    ')
      call deoplete#custom#source('tabnine', 'mark', '    ')

  " Variable: {{{
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

