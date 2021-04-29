return require'packer'.startup(function()
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- use { '~/Repositories/plenary.nvim', branch = 'bustin-makes-you-feel-good' }

  -- Treesitter:
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate all' }
  use 'nvim-treesitter/playground'
  -- use 'tjdevries/tree-sitter-lua'

  -- LSP:
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'

  -- Completion:
  use 'hrsh7th/nvim-compe'
  use 'norcalli/snippets.nvim'
  use 'hrsh7th/vim-vsnip'

  -- Need to try this as it looks promising:
  -- use 'L3MON4D3/LuaSnip'

  -- Git:
  use 'tpope/vim-fugitive'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-rhubarb'
  use 'sodapopcan/vim-twiggy'
  use 'junegunn/gv.vim'
  use 'rhysd/git-messenger.vim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'yamatsum/nvim-nonicons'},
      {'nvim-telescope/telescope-fzf-writer.nvim'}
    }
  }

  use 'mrk21/yaml-vim'

  -- Appearance
  use 'kyazdani42/nvim-web-devicons'
  use 'Mathijs-Bakker/gruvbox'

  use 'mhinz/vim-startify'
  -- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'sickill/vim-pasta'
  use 'airblade/vim-rooter'
  use 'euclidianAce/BetterLua.vim'
  -- use 'ThePrimeagen/harpoon'
  use 'tjdevries/nlua.nvim'
  use 'Mathijs-Bakker/zoom-vim'
end)
