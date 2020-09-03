" Note: this is required for the plugin to work
filetype indent plugin on

" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1
" Use system installed Mono:
"let g:OmniSharp_server_use_mono = 1
" Start server in current path when there is no solution file
let g:OmniSharp_start_without_solution = 1 

" Set the type lookup function to use the preview window 
let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
"let g:OmniSharp_timeout = 5

" Popups:
" Enable popups 
let g:OmniSharp_popup = 1

"let g:OmniSharp_popup_options = {
"            \ 'wrap': v:true,
"            \ 'winblend': 30,
"            \ 'winhl': 'Normal:Normal'
"            \}
"" Don't autoselect first omnicomplete option, show options even if there is only
"" one (so the previe documentation is accessible). Remove 'preview', 'popup'
"" and 'popuphidden' if you don't want to see any documentation whatsoever.
"" Note that neovim does not support `popuphidden` or `popup` yet: 
"" https://github.com/neovim/neovim/issues/10996
"set completeopt=longest,menuone,preview ",popuphidden
"
"" Highlight the completion documentation popup background/foreground the same as
"" the completion menu itself, for better readability with highlighted
"" documentation.
""set completepopup=highlight:Pmenu,border:off
"
"" Fetch full documentation during omnicomplete requests.
"" By default, only Type/Method signatures are fetched. Full documentation can
"" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 1
"
" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }
" Enable auto highlighting:
let g:OmniSharp_highlighting = 1
" Update semantic highlighting on BufEnter, InsertLeave and TextChanged
let g:OmniSharp_highlight_types = 2
" Show relevent diagnostic ID's for linters as ALE/Syntastic
let g:OmniSharp_diagnostic_showid = 1
"
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
"
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

"nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
"
"" Start the omnisharp server for the current solution
"nnoremap <Leader>ss :OmniSharpStartServer<CR>
"nnoremap <Leader>sp :OmniSharpStopServer<CR>
"
"" Enable snippet completion
"let g:OmniSharp_want_snippet=1

