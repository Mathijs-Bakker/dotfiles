" Format Options are set/overridden by neovim: ../share/nvim/runtime/ftplugin/vim.vim line 42
" So for user defined formatoptions, they need to be set in 'after' directory 

" Format Options: {{{
set formatoptions-=t  " Autowrap using textwidth
set fo+=c             " Autowrap commands using textwidth
set fo-=r             " Auto insert current comment leader after <CR> 
set fo-=o             " Don't do the latter w/ 'o' or 'O' in normal mode
set fo+=q             " Allow formatting comments with 'gq'
set fo+=w             " Trailing whitespace indicates text continuation
set fo-=a             " Autoformatting paragraphs
set fo+=n             " Recognize numbered lists
set fo-=2             " Indentation follows the indent of second line
set fo+=j             " Remove comments when joining lines
set fo+=p             " Don't break at single spaces that follow periods
" }}}
