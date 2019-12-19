" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" THEMES:
"
" Gui Font (MacVim)
set guifont=MesloLGSNer-Regular:h18

" Theme Solarized
syntax enable

if has('gui_running') " When MacVim use light theme
    set background=light
else
    set background=dark
    let g:solarized_termtrans=1
end

colorscheme solarized

" air-line theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Line numbering:
set rnu
set nu

" Scrolling offset (n of lines above/under the cursor)
set scrolloff=5

" Turn on auto indent
set autoindent

" Show existing tabs with 2 spaces
set tabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tabs, insert 2 spaces
set expandtab

" Highlight current line
set cursorline

" Highlight search matches
set hlsearch
set incsearch
set ignorecase
set smartcase


" Look in all underlying paths
set path+=**

" Set wild menu tabs
set wildmenu
set wildmode=list:full


" Omnisharp
let g:OmniSharp_server_stdio=1
let g:OmniSharp_server_use_mono = 1

" ALE
let g:ale_linters = {
      \ 'cs': ['OmniSharp'],
      \ 'javascript': ['flow', 'eslint'],
      \ }

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'cs': ['uncrustify'],
      \ 'html': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'markdown': ['prettier'],
      \ }

let g:ale_completion_enabled = 1

" Asyncomplete
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1
