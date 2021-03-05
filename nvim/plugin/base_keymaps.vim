scriptencoding utf-8

" Plenary Busted: {{{
   nmap <Leader>t <Plug>PlenaryWriteAndRunTestFile<CR> 
" }}}

" Movement: {{{

    " Lines up and down {{{
        " nnoremap <C-j> :m .+1<CR>==
        " nnoremap <C-k> :m .-2<CR>==
        inoremap <C-j> <Esc>:m .+1<CR>==gi
        inoremap <C-k> <Esc>:m .-2<CR>==gi
        " 'gv' to hl back 
        vnoremap <C-j> :m '>+1<cr>gv=gv
        vnoremap <C-k> :m '<-2<cr>gv=gv
    " }}}

    " Navigate to next error {{{
        nnoremap <leader>l :lnext<CR>
        nnoremap <leader>h :lprevious<CR>
    " }}}
" }}}

" Tabs, Splits, Windows & Buffers: {{{

    " Tab switching: {{{
        nnoremap <right> gt
        nnoremap <left>  gt
    " }}}

    " Split navigation: {{{ 
        noremap <c-h> <c-w><c-h>
        noremap <c-j> <c-w><c-j>
        noremap <c-k> <c-w><c-k>
        noremap <c-l> <c-w><c-l>
    " }}}

    " Easy moving between the buffers: {{{
       tnoremap <A-h> <C-\><C-n><C-w>h
       tnoremap <A-j> <C-\><C-n><C-w>j
       tnoremap <A-k> <C-\><C-n><C-w>k
       tnoremap <A-l> <C-\><C-n><C-w>l

       nnoremap <A-h> <C-w>h
       nnoremap <A-j> <C-w>j
       nnoremap <A-k> <C-w>k
       nnoremap <A-l> <C-w>l
    " }}} 

    " Window sizing: {{{
      " Resize windows to be basically the same size
        nnoremap <leader>= <C-w>=

      " Sizing window horizontally
        nnoremap <c-,> <C-W><
        nnoremap <c-.> <C-W>>
        nnoremap <A-,> <C-W>5<
        nnoremap <A-.> <C-W>5>

      " Sizing window vertically
       " taller
        nnoremap <A-t> <C-W>+
        " shorter
        nnoremap <A-s> <C-W>-
    " }}}
" }}}

" Escape: {{{
  " Set kj to be escape in insert mode
    inoremap kj <esc>
    vnoremap kj <esc>
" }}}

" Clear Search Highligths: {{{
    nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
" }}}

" Try And Make Sure To Not Mangle Space Items: {{{
    tnoremap <S-Space> <Space>
    tnoremap <C-Space> <Space>
" }}}

" Source This File: {{{

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
    nnoremap <leader><leader>x :call <sid>save_and_exec()<cr>
" }}}

" Remove Whitespace: {{{
    nnoremap <leader>sws :%s/\s\+$//<CR>
" }}}

" Black Hole Sun: {{{
  " Delete/change into blackhole buffer
    nmap <leader>d "_d
    nmap <leader>c "_c
    nmap <space>d "_d
    nmap <space>c "_c
" }}}

" Zoom split to full window and back:
nmap <Leader>z <Plug>Zoom

