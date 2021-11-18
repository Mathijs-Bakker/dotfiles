return require'packer'.startup(function()
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- use { '~/Repositories/plenary.nvim', branch = 'bustin-makes-you-feel-good' }
  use { '~/Repositories/refactoring.nvim' }

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
  use 'hrsh7th/nvim-cmp'
  -- use 'norcalli/snippets.nvim'
  -- use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'

  -- Git:
  use 'ThePrimeagen/git-worktree.nvim'
  use 'tpope/vim-fugitive'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-rhubarb'
  use 'sodapopcan/vim-twiggy'
  use 'junegunn/gv.vim'
  use 'rhysd/git-messenger.vim'
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      -- {'yamatsum/nvim-nonicons'},
      {'nvim-telescope/telescope-fzf-writer.nvim'}
    }
  }

  -- File Explorer
  -- use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
  use {'tamago324/lir.nvim'}
  use {'tamago324/lir-bookmark.nvim'}
  use {'tamago324/lir-git-status.nvim'}

  -- Reload
  use { 'famiu/nvim-reload', requires = { 'nvim-lua/plenary.nvim' }}

  -- Which Key?
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }

  use 'mrk21/yaml-vim'

  -- Appearance
  use 'kyazdani42/nvim-web-devicons'
  use 'Mathijs-Bakker/gruvbox'
  -- use 'lifepillar/vim-gruvbox8'

  -- Writing
  use 'junegunn/goyo.vim'

  -- Misc:
  use 'mhinz/vim-startify'
  -- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'sickill/vim-pasta'
  -- use 'airblade/vim-rooter'
  use 'oberblastmeister/rooter.nvim'
  use 'euclidianAce/BetterLua.vim'
  use 'ThePrimeagen/harpoon'
  use 'tjdevries/nlua.nvim'
  use 'Mathijs-Bakker/zoom-vim'
  use 'dstein64/vim-startuptime'
end)
