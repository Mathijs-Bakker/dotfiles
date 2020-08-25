" Disable Arrow Keys (<nop> no operation):
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

filetype plugin on
"let mapleader=","                      " Set <leader>.

" GuiFont :
if has("gui_running") 
    set guifont=MesloLGSNer-Regular:h18 " Set font for gVim. But not for nvim-qt
endif

" Rulers :
set rnu                                 " Relative numbering.
set nu                                  " Line nubering.

" Scrolling offset:
set scrolloff=5                         " Lines above and under cursor

" Turn on autoindent
set autoindent                          " Respect indentation starting new line
set tabstop=4                           " Number of spaces tab is counted for.

" Indentation : 
set shiftwidth=4                        " Number of spaces for autoindent.
" On pressing tabs, insert 2 spaces

set expandtab

"set foldmethod=indent                   " Folding based on indentation.
"autocmd BufRead * normal zR             " Keep folds open when opening new file.

" Highlight current line
set cursorline

" Visual line to mark 80 chars 
set colorcolumn=80,120                  
highlight ColorColumn ctermbg=0 guibg=lightgrey    " The Line color

" Search :
set hlsearch                            " Highlight matches
set incsearch                           " Dynamically move to first match while typing
set ignorecase
set smartcase

" Unset the "last search pattern" register by hitting return
nnoremap <CR> :nohlsearch<CR><CR>

" Swap files:
if empty(glob('$HOME/.vim/swap'))
    silent !mkdir -p $HOME/.vim/swap
endif
set directory=$HOME/.vim/swap//               " Place all swap files here

" Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Look in all underlying paths
set path+=**

" Clipboard Integration:
set clipboard+=unnamedplus        " ALWAYS use the clipboard for ALL operations

set mouse=nv

" Enable wildmenu
set wildmenu                      " Enable enhanced tab autocomplete.
set wildmode=list:longest,full   " Complete till longest string, then open the wild menu.         

"set wildoptions=pum
"set pumblend=20
