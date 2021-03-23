" Trigger completion with <CR>: {{{
    let g:UltiSnipsExpandTrigger = '<nop>'
    inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
" }}}

let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "UnitySnippets", "ZenjectSnippets", "LuaSnippets"]
