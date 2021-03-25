return require'packer'.startup(function()
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'norcalli/snippets.nvim'
  use 'mhinz/vim-startify'
  use 'morhetz/gruvbox'
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'sickill/vim-pasta'
end)
