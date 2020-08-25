set nocompatible

"let g:python_host_prog = $HOME."/.pyenv/versions/neovim2/bin/python"
let g:python_host_prog = "/usr/local/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"

" Gruvbox:
autocmd vimenter * colorscheme gruvbox
set termguicolors
" end gruvbox 

source $HOME/.dotfiles/nvim/autoInstall-VimPlug-PluginManager.vim
source $HOME/.dotfiles/nvim/base.vim
source $HOME/.dotfiles/nvim/plugins.vim
"source $HOME/.dotfiles/nvim/themes/solarized.vim

