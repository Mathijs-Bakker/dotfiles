" PlugUpdate, Install or update plugins
" PlugClean, Remove unlisted plugins
" PlugStatus, Check the status of plugins

" AutoInstall: {{{

    if empty(glob('~/.config/nvim/plugged/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/plugged/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

"}}}

let $pluginConfigPath = $HOME.'/.dotfiles/nvim/rc/pluginconfigs'

call plug#begin('~/.dotfiles/nvim/plugged')

" Plugin Development: {{{

    Plug '~/Repositories/test-explorer.nvim'
    " let g:dottestchili_show_results_leftside = 1
    let g:testexplorer_filename_match_tests= 1

" }}}

" Treesitter: {{{
    Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
" }}}

" Plenary: {{{

    " Plug 'Mathijs-Bakker/plenary.nvim', { 'branch': 'bustin-makes-you-feel-good' }

    Plug '~/Repositories/plenary.nvim', { 'branch': 'bustin-makes-you-feel-good' }
    " Plug 'nvim-lua/plenary.nvim'

    Plug 'norcalli/nvim-terminal.lua'
" }}}

" Telescope: {{{

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Plug 'nvim-lua/telescope.nvim'

    Plug 'nvim-telescope/telescope-cheat.nvim'
    Plug 'nvim-telescope/telescope-frecency.nvim'
    Plug 'nvim-telescope/telescope-fzf-writer.nvim'
" }}}

" AESTHETICS: {{{

    " Color Schemes: {{{
    
        " Plug 'gruvbox-community/gruvbox'
        Plug 'Mathijs-Bakker/gruvbox'

    " }}}

    " Status Bar: {{{
    
        Plug 'itchyny/lightline.vim'
        Plug 'Mathijs-Bakker/vim-base16-lightline/'

    " }}}
" }}}

" LSP: {{{
    Plug 'neovim/nvim-lspconfig'
    " Plug 'nvim-lua/completion-nvim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-lua/lsp_extensions.nvim'
    Plug 'nvim-lua/lsp-status.nvim'                 
    Plug 'onsails/lspkind-nvim'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'tjdevries/nlua.nvim'
    Plug 'euclidianAce/BetterLua.vim'
" }}}

" LANGUAGE SPECIFIC: {{{

    " C# {{{
    
        " OmniSharp: {{{ 
          "  Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}
        " }}}

        " Sharpen Up: {{{
        " Better defined default OmniSharp mappings and integrations
            " Plug 'nickspoons/vim-sharpenup'
        " " }}}

    " }}}

    " Markdown: {{{
    
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

        " Open .md files in Marked.app - mapped to <leader>m
        Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
    " }}}

    " JSON: {{{
    
    "    Plug 'elzr/vim-json', { 'for': 'json' }
    "    let g:vim_json_syntax_conceal = 0
    " }}}

    " Cheat.sh: {{{
        Plug 'dbeniamine/cheat.sh-vim'
    " }}}

" }}}

" GENERAL: {{{

    " STARTUP: {{{

        " Startify: {{{
           Plug 'mhinz/vim-startify'
        " }}}
 
    " }}}

    " COMPLETION: {{{

    "    " Deoplete: {{{
    "        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "        Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    "        Plug 'zchee/deoplete-jedi'
    "    " }}}

        Plug 'hrsh7th/nvim-compe'
        Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }

        " UltiSnips: {{{
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
            Plug 'Mathijs-Bakker/vim-unity-snippets'
        " }}}

    " }}}

    " LINTING: {{{ 

    "   " ALE {{{
    "        " Plug 'dense-analysis/ale'
    "    " }}}

    " }}}

    " FUZZY FINDER: {{{
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
    " }}}

    " GIT: {{{

        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb' " hub extension for fugitive
        Plug 'junegunn/gv.vim'
        Plug 'sodapopcan/vim-twiggy'
        Plug 'rhysd/git-messenger.vim'

        Plug 'pwntester/octo.nvim' " Telescope >> Issues and PR viewing
    " }}}

    " File System: {{{
     
        " NERDTree: {{{
           " Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

    "        Plug 'Xuyuanp/nerdtree-git-plugin'
    "        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    "    " }}}
    "
        
        " Dirvish: {{{
            Plug 'justinmk/vim-dirvish'
        "}}}

            Plug 'ryanoasis/vim-devicons'

        " Ranger: {{{ 
            " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
            " source $pluginConfigPath/ranger.vim
        " }}}

        " Rooter: {{{
            " Rooter changes working dir to project root of the current file
            Plug 'airblade/vim-rooter'
        " }}}

     " }}}
     
    " EDITING: {{{

        " Autoclose: {{{
            " Auto close brackets/parentheses: 
            " Plug 'townk/vim-autoclose'
        " }}}
         
        " Commenting: {{{
            Plug 'tpope/vim-commentary'
        " }}}
         
        " Unimpaired: {{{
            " mappings which are simply short normal mode aliases for commonly used ex commands
            Plug 'tpope/vim-unimpaired'
        " }}}
        
        " Surround: {{{
            " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
            " Plug 'tpope/vim-surround'
        " }}}

        " Ragtag: {{{
            " endings for html, xml, etc. - ehances surround
            Plug 'tpope/vim-ragtag'
        " }}}
        
        " Dot Repeat: {{{
            " enables repeating other supported plugins with the . command
            Plug 'tpope/vim-repeat'
        " }}}

       " EditorConfig: {{{
           " EditorConfig helps define and maintain consistent coding styles
           Plug 'editorconfig/editorconfig-vim'
        " }}}

        " SplitJoin: {{{
            " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
            Plug 'AndrewRadev/splitjoin.vim'
        " }}}

        " Endwise: {{{
            " add end, endif, etc. automatically
            Plug 'tpope/vim-endwise' " <CR> conflicts with COC
        " }}}

    "    " Slueth: {{{
    "    " Somehow this does bad things with Lua files
    "         " detect indent style (tabs vs. spaces)
    "      "   Plug 'tpope/vim-sleuth'
    "    " }}}
        
        " Pasta: {{{
            " Remap p and P in normal and visual mode for context aware pasting.
            Plug 'sickill/vim-pasta'
        " }}}

    " }}}

    " WINDOWS: {{{

       " Zoom: {{{
           " Zooms splits to full window and back
           Plug 'Mathijs-Bakker/zoom-vim'
       " }}}

    " }}}

    " TERMINAL: {{{
 
         " TMUX: {{{
            Plug 'benmills/vimux'
         " }}}

    " }}}

    " FUN: {{{
        " Discord:
        Plug 'andweeb/presence.nvim'
    " }}}

"}}}
call plug#end()
