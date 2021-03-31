if require'packer.install_packer'() then
  return
end

vim.g.mapleader = ','

require'globals'
require'config.options'
require'config.keymaps'
require'packer.plugins'
require'plugin.completion'
require'plugin'
require'lsp'

vim.cmd(':source $HOME/.dotfiles/nvim/autoload/file_sourcer.vim')
