set nocompatible

let g:python_host_prog = "/usr/local/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"

" Gruvbox: {{{
    autocmd vimenter * colorscheme gruvbox
    set termguicolors
" }}} 

source $HOME/.dotfiles/nvim/rc/base.vim
source $HOME/.dotfiles/nvim/rc/plugins.vim

let g:deoplete#enable_at_startup = 1

