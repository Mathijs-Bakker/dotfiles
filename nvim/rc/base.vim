filetype plugin on

let mapleader=","                      " Set <leader>.

" GuiFont :
if has("gui_running") 
    set guifont=MesloLGSNer-Regular:h18 " Set font for gVim. But not for nvim-qt
endif

" Rulers: {{{
    set rnu                             " Relative numbering
    set nu                              " Line numbering
" }}}

" Scrolling: {{{
    set scrolloff=5                     " Top and bottom offset:
    set mouse=nv                        " a = all, nv = modes
" }}}

" Turn on autoindent
set autoindent                          " Respect indentation starting new line

" Tab spacing: {{{
    set smarttab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround

    set expandtab
" }}}

"set foldmethod=indent                   " Folding based on indentation.
"autocmd BufRead * normal zR             " Keep folds open when opening new file.

" Highlight current line
set cursorline

" Visual line to mark 80 chars 
set colorcolumn=80,120                  
highlight ColorColumn ctermbg=0 guibg=lightgrey    " The Line color

" Search: {{{
    set hlsearch                            " Highlight matches
    set incsearch                           " Dynamically move to first match while typing
    set ignorecase
    set smartcase
    set nolazyredraw 

    set magic                               " Regex magic

    " Unset the "last search pattern" register by hitting return
    "nnoremap <CR> :nohlsearch<CR><CR>
" }}} 

" Swap files:
if empty(glob('$HOME/.vim/swap'))
    silent !mkdir -p $HOME/.vim/swap
endif
set directory=$HOME/.vim/swap//               " Place all swap files here

" Error Bells: {{{
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
"}}}

" Cursor: {{{
    " Switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
" }}}

" Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Zoom split to full window and back:
nmap <Leader>z <Plug>Zoom

" Look in all underlying paths
set path+=**

" Clipboard Integration:
set clipboard+=unnamedplus        " ALWAYS use the clipboard for ALL operations


" Enable wildmenu
set wildmenu                      " Enable enhanced tab autocomplete.
set wildmode=list:longest,full   " Complete till longest string, then open the wild menu.         

"set wildoptions=pum
"set pumblend=20
