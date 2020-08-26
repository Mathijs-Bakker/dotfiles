" PlugUpdate, Install or update plugins
" PlugClean, Remove unlisted plugins
" PlugStatus, Check the status of plugins

let $pluginConfigPath = $HOME.'/.dotfiles/nvim/rc/pluginconfigs'

call plug#begin('~/.vim/plugged')

" AESTHETICS: {{{

    " Color Schemes {{{
        Plug 'gruvbox-community/gruvbox'
    " }}}

    " Status bar / Tabline {{{
        Plug 'itchyny/lightline.vim'
        Plug 'Mathijs-Bakker/vim-base16-lightline/'
        source $pluginConfigPath/lightline.vim
    " }}}
" }}}

" LANGUAGE: {{{
    " C# {{{
        " OmniSharp: {{{ 
           Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}
           source $pluginConfigPath/omnisharp.vim
        " }}}

      " Markdown {{{
          Plug 'tpope/vim-markdown', { 'for': 'markdown' }
          let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

          " Open .md files in Marked.app - mapped to <leader>m
          Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }

          nmap <leader>m :MarkedOpen!<cr>
          nmap <leader>mq :MarkedQuit<cr>
          nmap <leader>* *<c-o>:%s///gn<cr>

    " }}}

    " JSON {{{
        Plug 'elzr/vim-json', { 'for': 'json' }
        let g:vim_json_syntax_conceal = 0
    " }}}

" GENERAL: {{{

    " COMPLETION: {{{
    "
         " COC {{{
               Plug 'neoclide/coc.nvim', {'branch': 'release'}
               source $pluginConfigPath/coc.vim
         " }}}

         " UltiSnips {{{
               Plug 'SirVer/ultisnips'
               Plug 'honza/vim-snippets'
               Plug 'Mathijs-Bakker/vim-unity-snippets'
               source $pluginConfigPath/ultisnips.vim
         " }}}

    " LINTING: {{{ 
       " ALE {{{
              Plug 'dense-analysis/ale'
              source $pluginConfigPath/ale.vim
        " }}}
    " }}}
    
    " FUZZY FIND: {{{
         Plug 'junegunn/fzf.vim'
         source $pluginConfigPath/fzf.vim 
      " }}}

      " GIT: {{{
            Plug 'tpope/vim-fugitive'
            nmap <silent> <leader>gs :Gstatus<cr>
            nmap <leader>ge :Gedit<cr>
            nmap <silent><leader>gr :Gread<cr>
            nmap <silent><leader>gb :Gblame<cr>
        
            Plug 'tpope/vim-rhubarb' " hub extension for fugitive
            Plug 'junegunn/gv.vim'
            Plug 'sodapopcan/vim-twiggy'
      " }}}

"}}}


" Rooter changes working dir to project root when opening a file or dir
Plug 'airblade/vim-rooter'

" Ranger:
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
source $pluginConfigPath/ranger.vim

" Zoom {{{
    " Zoom split to full window
    Plug 'Mathijs-Bakker/zoom-vim'
    nmap <leader>z <Plug>Zoom
" }}}

" Auto close brackets/parentheses: 
Plug 'townk/vim-autoclose'

" Comment stuff out
Plug 'tpope/vim-commentary'
"
" mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-unimpaired'

" endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-ragtag'

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-surround'

" tmux integration for vim
Plug 'benmills/vimux'

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat'

" EditorConfig helps define and maintain consistent coding styles
Plug 'editorconfig/editorconfig-vim'

" single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'AndrewRadev/splitjoin.vim'

" add end, endif, etc. automatically
" Plug 'tpope/vim-endwise' " <CR> conflicts with COC

" detect indent style (tabs vs. spaces)
Plug 'tpope/vim-sleuth'

" Startify: Fancy startup screen for vim {{{
   Plug 'mhinz/vim-startify'
   source $pluginConfigPath/startify.vim
" }}}

" Remap p and P in normal and visual mode for context aware pasting.
Plug 'sickill/vim-pasta'

call plug#end()
