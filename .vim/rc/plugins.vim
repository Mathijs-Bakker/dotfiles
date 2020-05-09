" Vim-Plug Commands:
" After adding a new plugin reload Vim and run:  PlugInstall
" PlugUpdate, Install or update plugins
" PlugClean, Remove unlisted plugins
" PlugStatus, Check the status of plugins

call plug#begin('~/.vim/plugged')

" Themes =====================================================================
" Airline --------------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Solarized ------------------------------------------------------------------
"Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
" End Themes -----------------------------------------------------------------

" OmniSharp ==================================================================
Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}

" VimDispatch ================================================================
Plug 'tpope/vim-dispatch'

" Ctrlp - Full path fuzzy file, buffer, mru, tag, ... finder =================
Plug 'ctrlpvim/ctrlp.vim'

" GIT
Plug 'tpope/vim-fugitive'

" ALE
" ==================================================================_
Plug 'dense-analysis/ale'

" UltiSnips ==================================================================
Plug 'SirVer/ultisnips'
" ----------------------------------------------------------------------------
Plug 'honza/vim-snippets'
Plug 'Mathijs-Bakker/vim-unity-snippets'
" End ultisnips -------------------------------------------------------------

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

" Deoplete ===================================================================
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" NERDTree :
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 

" Vim-Polyglot Syntax Highlighting
Plug 'sheerun/vim-polyglot'
" (Vim-Polyglot) language and indentation packs: ----------
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-git'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'tbastos/vim-lua'
Plug 'gabrielelana/vim-markdown'
Plug 'ericpruitt/tmux.vim', {'rtp': 'vim/'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'amadeus/vim-xml'
Plug 'stephpy/vim-yaml'

"----------------------------------------

" Vim-Polyglot language packs END

Plug 'gabrielelana/vim-markdown'

Plug 'mileszs/ack.vim'

call plug#end()

" Plugin configuration files:
let $plugconfig = $HOME.'/.vim/rc/pluginconfigs'

source $plugconfig/omnisharp.vim
source $plugconfig/ale.vim
source $plugconfig/ultisnips.vim
source $plugconfig/asyncomplete.vim
source $plugconfig/deoplete.vim
source $plugconfig/nerdtree.vim
