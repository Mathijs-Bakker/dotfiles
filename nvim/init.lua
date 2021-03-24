if require'packer.install_packer'() then
  return
end

vim.g.mapleader = ','

require'keymaps'
require'packer.plugins'
