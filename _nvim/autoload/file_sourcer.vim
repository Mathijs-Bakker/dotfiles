" SourCurrent File: {{{

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
