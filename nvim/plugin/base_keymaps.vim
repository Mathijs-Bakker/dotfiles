scriptencoding utf-8

" Movement: {{{
    " move selected lines while updating indentation, <gv> to hl back {{{
        vnoremap <C-a-j> :m '>+1<cr>gv=gv
        vnoremap <C-k> :m '>-2<cr>gv=gv
    " }}}
" }}}

" Navigation {{{
    " Split: {{{ 
        noremap <c-h> <c-w><c-h>
        noremap <c-j> <c-w><c-j>
        noremap <c-k> <c-w><c-k>
        noremap <c-l> <c-w><c-l>
    " }}}
" }}}

" Set kj to be escape in insert mode
inoremap kj <esc>

" Execute this file
function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif

  return
endfunction
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>

" Remove whitespace
nnoremap <leader>sws :%s/\s\+$//<CR>
" Zoom split to full window and back:
nmap <Leader>z <Plug>Zoom

