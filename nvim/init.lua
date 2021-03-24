if require'packer.install_packer'() then
  return
end

vim.g.mapleader = ','

require'globals.keybinder'
require'keymaps'
require'packer.plugins'
require'plugin.completion'
