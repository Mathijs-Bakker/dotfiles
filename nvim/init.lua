if require'packer.install_packer'() then
  return
end

vim.g.mapleader = ','

--[[ Global helpers needs to be on top of init.lua --]]
require('globals.non_blocking_sourcer')
Source('globals')

Source('config.options')
Source('config.keymaps')
Source('packer.plugins')
Source('plugin.completion')
Source('plugin')
Source('lsp')

vim.cmd(':source $HOME/.dotfiles/nvim/autoload/file_sourcer.vim')
