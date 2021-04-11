if require'packer.install_packer'() then
  return
end

vim.g.mapleader = ','

--[[ Global helpers needs to be on top of init.lua --]]
require('globals.utils')
TrySource('globals')
--

TrySource('config.options')
TrySource('config.keymaps')
TrySource('packer.plugins')
TrySource('plugconfigs.completion')
TrySource('plugconfigs')
TrySource('lsp')

vim.cmd(':source $HOME/.dotfiles/nvim/autoload/file_sourcer.vim')
