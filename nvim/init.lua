if require 'packer.install_packer'() then
  return
end

-- [[ Be sure to set leader key first ]]--
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '

--[[ Global helpers needs to be on top of init.lua --]]
require 'globals.utils'
TrySource 'globals'
--
TrySource 'config.options'
TrySource 'config.keymaps'
TrySource 'config.statusline'

TrySource 'packer.plugins'
TrySource 'plugins.completion'
TrySource 'plugins'
TrySource 'lsp'

vim.cmd ':source $HOME/.dotfiles/nvim/autoload/file_sourcer.vim'

Cmd [[ augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END ]]
