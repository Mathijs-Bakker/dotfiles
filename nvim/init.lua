if require'packer.install_packer'() then
  return
end

vim.g.mapleader = ','

--[[ Global helpers needs to be on top of init.lua --]]
require('globals.sourcer')
TrySource('globals')

TrySource('config.options')
TrySource('config.keymaps')
TrySource('packer.plugins')
TrySource('plugin.completion')
TrySource('plugin')
TrySource('lsp')

vim.cmd(':source $HOME/.dotfiles/nvim/autoload/file_sourcer.vim')
