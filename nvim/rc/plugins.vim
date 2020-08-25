" Vim-Plug Commands:
" After adding a new plugin reload Vim and run:  PlugInstall
" PlugUpdate, Install or update plugins
" PlugClean, Remove unlisted plugins
" PlugStatus, Check the status of plugins

let $pluginConfigPath = $HOME.'/.dotfiles/nvim/rc/pluginconfigs'

call plug#begin('~/.vim/plugged')

" Eye Candy:
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'lifepillar/vim-solarized8'
"Plug 'morhetz/gruvbox'
"Plug 'Mathijs-Bakker/gruvbox'
Plug 'gruvbox-community/gruvbox'

" OmniSharp: 
Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}
source $pluginConfigPath/omnisharp.vim

Plug 'OrangeT/vim-csharp'

" Deoplete: 
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Sources
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"Plug 'zchee/deoplete-jedi'
"source $pluginConfigPath/deoplete.vim

" ALE:
Plug 'dense-analysis/ale'
source $pluginConfigPath/ale.vim

" Filesystem: 
" fzf.vim - (Omnisharp Code Actions, Find Type and Find Symbol features)======
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Rooter changes working dir to project root when opening a file or dir
Plug 'airblade/vim-rooter'

" Ranger:
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
source $pluginConfigPath/ranger.vim

Plug 'nickspoons/vim-movefast'

" COC 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source $pluginConfigPath/coc.vim

" Auto close brackets/parentheses: 
Plug 'townk/vim-autoclose'

" VimSurround:
Plug 'tpope/vim-surround'

" Syntastic - OmniSharp (optional):
Plug 'vim-syntastic/syntastic'
source $pluginConfigPath/syntastic.vim

" Git:
Plug 'tpope/vim-fugitive'

" UltiSnips:
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Mathijs-Bakker/vim-unity-snippets'
"source $pluginConfigPath/ultisnips.vim
" End ultisnips -------------------------------------------------------------

"Plug 'mileszs/ack.vim'

call plug#end()
