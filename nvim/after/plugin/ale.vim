" Close loclist window when closing buffer: {{{
    augroup CloseLoclistWindowGroup
      autocmd!
      autocmd QuitPre * if empty(&buftype) | lclose | endif
    augroup END
" }}}

let g:airline#extensions#ale#enabled = 1

let g:ale_open_list = 'on_save'
let g:ale_keep_list_window_open = 0
" let g:ale_set_loclist = 1
let g:ale_list_window_size = 3

let g:ale_linters = {
    \ 'cs': ['OmniSharp']
    \ }

let g:ale_completion_symbols = {
  \ 'text': '',
  \ 'method': '',
  \ 'function': '',
  \ 'constructor': '',
  \ 'field': '',
  \ 'variable': '',
  \ 'class': '',
  \ 'interface': '',
  \ 'module': '',
  \ 'property': '',
  \ 'unit': 'unit',
  \ 'value': 'val',
  \ 'enum': '',
  \ 'keyword': 'keyword',
  \ 'snippet': '',
  \ 'color': 'color',
  \ 'file': '',
  \ 'reference': 'ref',
  \ 'folder': '',
  \ 'enum member': '',
  \ 'constant': '',
  \ 'struct': '',
  \ 'event': 'event',
  \ 'operator': '',
  \ 'type_parameter': 'type param',
  \ '<default>': 'v'
  \ }
