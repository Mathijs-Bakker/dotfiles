-- Be sure to set leader key first --
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '


require 'lazyinit'

require 'config'
-- Statusline
require 'statusline'
require('fidget').setup {}
-- Highlights the yanked characters/lines
vim.cmd [[ augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END ]]
