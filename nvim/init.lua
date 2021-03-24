if require'packer.install_packer'() then
  return
end

vim.g.mapleader = ','

require'global_helpers'
require'keymaps'
require'packer.plugins'
require'plugin.completion'
