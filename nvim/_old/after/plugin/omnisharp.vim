"" Note: this is required for the plugin to work
"filetype indent plugin on

"" Server: {{{

"    " Use the stdio OmniSharp-roslyn server
"    let g:OmniSharp_server_stdio = 1

"    " Use system installed Mono:
"    "let g:OmniSharp_server_use_mono = 1

"    " Start server in current path when there is no solution file
"    let g:OmniSharp_start_without_solution = 1 

"    " Timeout in seconds to wait for a response from the server
"    "let g:OmniSharp_timeout = 5

"    " For stdio the possible values are 'debug', 'info' and 'none'.
"    " default: 'info'
"    let g:OmniSharp_loglevel = 'info'

"" }}}

"" Preview: {{{

"    " Set the type lookup function to use the preview window 
"    let g:OmniSharp_typeLookupInPreview = 1

"    "By default, only type/method signatures are fetched
"    let g:omnicomplete_fetch_full_documentation = 0

"    " Displays the implementation of the interface/class under the cursor in the preview window. 
"    let g:OmniSharpPreviewImplementation = 1

"    " Set desired preview window height for viewing documentation.
"    " You might also want to look at the echodoc plugin.
"    set previewheight=5

"" }}}

"" Popup: {{{
"    " Enable popups 
"    let g:OmniSharp_popup = 1
"    let g:OmniSharp_popup_options = 'atcursor' " options: atcursor, peek, center
"    let g:OmniSharp_popup_options = {
"        \ 'wrap': v:true,
"        \ 'winblend': 30,
"        \ 'winhl': 'Normal:Normal'
"        \}
"" }}}

"" Diagnostics and Linting: {{{

"    " Tell ALE to use OmniSharp for linting C# files
"    let g:ale_linters = { 'cs': ['OmniSharp'] }

"    " Include the ID in diagnostic outputs
"    let g:OmniSharp_diagnostic_showid = 1

"    " Override diagnostic severity for linters
"    " 'E': Error, 'W': Warning, 'I'L Info, 'None'
"    " let g:OmniSharp_diagnostic_overrides = {
"    " \ 'CS8019': {'type': 'None'},
"    " \ 'RemoveUnnecessaryImportsFixable': {'type': 'None'}
"    " \}

"" }}}

"" Highlighing: {{{

"    " Enable auto highlighting on bufenter:
"    let g:OmniSharp_highlighting = 0 
"    " Highlight on BufEnter, InsertLeave and TextChanged:
"    let g:OmniSharp_highlighting = 0
"    " Highlight after all text changes (all of the above, plus TextChangedI and TextChangedP):
"    let g:OmniSharp_highlighting = 3

"" }}}

"" Integrations: {{{

"    " Selector UI for choosing code actions and navigating to symbols.
"    " If set to '', the vim command-line and quickfix window will be used
"    let g:OmniSharp_selector_ui = 'fzf'

"    " Allows |:OmniSharpFindUsages| to use fzf or vim-clap as a selector, instead of populating the quickfix.  Default: '' > 
"    let g:OmniSharp_selector_findusages = 'fzf'

"    " Use this to pass custom options to fzf 
"    let g:OmniSharp_fzf_options = { 'right': '50%' } 

"    " Enable snippet completion, when ultisnips is available.  
"    let g:OmniSharp_want_snippet = 0

"" }}}

"" Misc: {{{

"    " Look up metadata for compiled types
"    let g:OmniSharp_lookup_metadata = 1

"    " Auto opening quickfix window for find usages, implementations, etc.
"    let g:OmniSharp_open_quickfix = 1

"" }}}

"" AutoCmds: {{{

"augroup omnisharp_commands
"    autocmd!

"    " Show type information automatically when the cursor stops moving.
"    " Note that the type is echoed to the Vim command line, and will overwrite
"    " any other messages in this space including e.g. ALE linting messages.
"    autocmd CursorHold *.cs OmniSharpTypeLookup

"    " The following commands are contextual, based on the cursor position.
"    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

"    " Finds members in the current buffer
"    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

"    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
"    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
"    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

"    " Navigate up and down by method/property/field
"    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
"    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
""
"    " Find all code errors/warnings for the current solution and populate the quickfix window
"    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
"augroup END

"" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
"nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
"" Run code actions with text selected in visual mode to extract method
"xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

"" Rename with dialog
"nnoremap <Leader>nm :OmniSharpRename<CR>
"nnoremap <F2> :OmniSharpRename<CR>
"" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

""nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
""
""" Start the omnisharp server for the current solution
""nnoremap <Leader>ss :OmniSharpStartServer<CR>
""nnoremap <Leader>sp :OmniSharpStopServer<CR>

"" }}}
