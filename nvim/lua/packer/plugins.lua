return require'packer'.startup(function()
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'
  use { '~/Repositories/plenary.nvim', branch = 'bustin-makes-you-feel-good' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'norcalli/snippets.nvim'
  use 'mhinz/vim-startify'
  use 'morhetz/gruvbox'
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'sickill/vim-pasta'
  use 'airblade/vim-rooter'
  use 'euclidianAce/BetterLua.vim'
  use 'ThePrimeagen/harpoon'
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  use 'tjdevries/nlua.nvim'
end)
