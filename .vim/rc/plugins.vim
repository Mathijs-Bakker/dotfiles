" Vim-Plug Commands:
" After adding a new plugin reload Vim and run:  PlugInstall
" PlugUpdate, Install or update plugins
" PlugClean, Remove unlisted plugins
" PlugStatus, Check the status of plugins

call plug#begin('~/.vim/plugged')

" Airline and themes:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

"Plug 'OmniSharp/omnisharp-vim'
"Plug 'dense-analysis/ale'

" Coc code completion:
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'neoclide/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

" NERDTree:
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 


Plug 'sheerun/vim-polyglot'
Plug 'gabrielelana/vim-markdown'

call plug#end()

let g:coc_global_extensions=[ 'coc-omnisharp' ]

" Plugin configuration files:
source $HOME/.vim/rc/plugins/nerdtree.vim
source $HOME/.vim/rc/plugins/coc.vim
