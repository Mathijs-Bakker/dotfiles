function! helpers#lightline#fileName() abort
     let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
     if filename =~ 'NERD_tree'
         return ''
     endif
     let modified = &modified ? ' +' : ''
     return fnamemodify(filename, ":~:.") . modified
 endfunction

function! helpers#lightline#fileEncoding()
    " only show the file encoding if it's not 'utf-7'
    return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

function! helpers#lightline#fileFormat()
    " only show the file format if it's not 'unix'
    let format = &fileformat == 'unix' ? '' : &fileformat
    return winwidth(0) > 70 ? format . ' ' . WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! helpers#lightline#fileType()
    return WebDevIconsGetFileTypeSymbol()
endfunction

function! helpers#lightline#gitBranch()
    return "\uE725" . (exists('*fugitive#head') ? ' ' . fugitive#head() : '')
endfunction

function! helpers#lightline#currentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Statusline: {{{
" set statusline^=%{helpers"lightline#lspStatus()}%{get(b:,'LspStatus','')}

function! LspStatus() abort

    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return 'foo'
endfunction
" }}}

function! helpers#lightline#lspStatus()
    return get(b:, 'LspStatus', '')
endfunction

function! helpers#lightline#gitBlame()
    return winwidth(0) > 100 ? strpart(get(b:, 'coc_git_blame', ''), 0, 20) : ''
endfunction


" function! helpers#lightline#lspStatus()
"     return winwidth(0) > 100 ? strpart(get(b:, 'LspStatus', ''), 0, 20) : ''
" endfunction
