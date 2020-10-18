scriptencoding utf-8
filetype plugin indent on

" Appearance: {{{

    " Rulers: {{{
        set rnu                             " Relative numbering
        set nu                              " Line numbering
    " }}}

    " Gruvbox: {{{
        autocmd vimenter * colorscheme gruvbox
        set termguicolors
    " }}} 

    "hlight current line
    set cursorline

    " Visual line to mark 80 chars 
        set colorcolumn=80,120                  
        highlight ColorColumn ctermbg=0 guibg=lightgrey    " The Line color

    " Cursor: {{{
        " Switch cursor to line when in insert mode, and block when not
        set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
        \,sm:block-blinkwait175-blinkoff150-blinkon175
    " }}}
" }}}

" Set Leader: {{{
    let mapleader=","
" }}}

" Scrolling: {{{
    set scrolloff=5                     " Top and bottom offset:
    set mouse=nv                        " a = all, nv = modes
" }}}

" Turn on autoindent
set autoindent                          " Respect indentation starting new line

" Tab spacing: {{
    set smarttab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround

    set expandtab
" }}}

"set foldmethod=indent                   " Folding based on indentation.
"autocmd BufRead * normal zR             " Keep folds open when opening new file.

" Hi" Search: {{{
    set hlsearch                            " Highlight matches
    set incsearch                           " Dynamically move to first match while typing
    set ignorecase
    set smartcase
    set nolazyredraw 

    set magic                               " Regex magic

    " Unset the "last search pattern" register by hitting return:
    nnoremap <CR> :nohlsearch<CR><CR>
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
"
" Clipboard Integration:
set clipboard+=unnamedplus        " ALWAYS use the clipboard for ALL operations

" Going Wild! (Enhanced <Tab>): {{{  
    set wildignore+=*.o,*~,*.pyc,*pycache* " Ignore compiled files               │   18 " }}}
    set wildignore+=__pycache__

    " Enable wildmenu: {{{
        set wildmenu                      " Enable enhanced tab autocomplete.
        set wildmode-=list
        set wildmode+=longest,full   " Complete till longest string, then open the wild menu.         
        set wildmode+=full   " Complete till longest string, then open the wild menu.         

        set wildoptions+=pum
        set pumblend=20
    " }}}
" }}}

" Paths: {{{

" Look in all underlying paths
set path+=**

    let g:python_host_prog = "/usr/local/bin/python"
    let g:python3_host_prog = "/usr/local/bin/python3"
" }}}

" set noshowmode " hide --Modes--
set cmdheight=1 " Command bar height
set hidden " Keep buffers until ':q!'

set splitright " splits windows to the right
set splitbelow " splits windows to bottom

set updatetime=1000 " faster updtes


set breakindent " Long lines respect indentation
let &showbreak=repeat(' ', 3) " But add some spaces
set linebreak

source $HOME/.dotfiles/nvim/rc/plugins.vim

let g:deoplete#enable_at_startup = 1

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all",     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     -- disable = { "c", "rust" },  -- list of language that will be disabled
"   },
" }
" EOF

