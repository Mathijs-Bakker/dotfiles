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

" LANGUAGE SPECIFIC: {{{

    " C# {{{
    
        " OmniSharp: {{{ 
            Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}
            source $pluginConfigPath/omnisharp.vim
        " }}}
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

" }}}

" GENERAL: {{{

    " STARTUP: {{{

        " Startify {{{
            Plug 'mhinz/vim-startify'
            source $pluginConfigPath/startify.vim
        " }}}
 
    " }}}

    " COMPLETION: {{{

        " Deoplete {{{
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
            Plug 'zchee/deoplete-jedi'
            " Source needs to be after 'plug#end' 
        " }}}

        " UltiSnips {{{
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
            Plug 'Mathijs-Bakker/vim-unity-snippets'
            source $pluginConfigPath/ultisnips.vim
        " }}}

    " }}}

    " LINTING: {{{ 

       " ALE {{{
            Plug 'dense-analysis/ale'
            source $pluginConfigPath/ale.vim
        " }}}

    " }}}

    " FUZZY FINDER: {{{

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

    " FILES AND FOLDERS: {{{
     
        " NERDTree {{{
            Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

            Plug 'Xuyuanp/nerdtree-git-plugin'
            Plug 'ryanoasis/vim-devicons'
            Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        " }}}

        " Ranger {{{ 
            Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
            source $pluginConfigPath/ranger.vim
        " }}}

        " Rooter {{{
            " Rooter changes working dir to project root of the current file
            Plug 'airblade/vim-rooter'
        " }}}

     " }}}
     
    " EDITING {{{

        " Autoclose {{{
            " Auto close brackets/parentheses: 
            Plug 'townk/vim-autoclose'
        " }}}
         
        " Commentary {{{
            " Commentng lines
            Plug 'tpope/vim-commentary'
        " }}}
         
        " Unimpaired {{{
            " mappings which are simply short normal mode aliases for commonly used ex commands
            Plug 'tpope/vim-unimpaired'
        " }}}
        
        " Surround {{{
            " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
            Plug 'tpope/vim-surround'
        " }}}

        " Ragtag {{{
            " endings for html, xml, etc. - ehances surround
            Plug 'tpope/vim-ragtag'
        " }}}
        
        " . Repeat {{{
            " enables repeating other supported plugins with the . command
            Plug 'tpope/vim-repeat'
        " }}}

        " EditorConfig {{{
            " EditorConfig helps define and maintain consistent coding styles
            Plug 'editorconfig/editorconfig-vim'
        " }}}

        " SplitJoin {{{
            " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
            Plug 'AndrewRadev/splitjoin.vim'
        " }}}

        " Endwise {{{
            " add end, endif, etc. automatically
            " Plug 'tpope/vim-endwise' " <CR> conflicts with COC
        " }}}

        " Slueth {{{
             " detect indent style (tabs vs. spaces)
             Plug 'tpope/vim-sleuth'
        " }}}
        
        " Pasta {{{
            " Remap p and P in normal and visual mode for context aware pasting.
            Plug 'sickill/vim-pasta'
        " }}}

    " }}}

     " WINDOWS/PANES: {{{

        " Zoom {{{
            " Zooms splits to full window and back
            Plug 'Mathijs-Bakker/zoom-vim'
            nmap <leader>z <Plug>Zoom
        " }}}

     " }}}

     " TERMINAL: {{{
 
         " Vimux {{{
            " tmux integration for vim
            Plug 'benmills/vimux'
         " }}}

      " }}}
"}}}
call plug#end()

source $pluginConfigPath/deoplete.vim
