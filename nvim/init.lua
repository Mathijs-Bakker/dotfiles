-- Be sure to set leader key first --
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '

if not require('packinit').setup() then
  return
end

require 'config'
require 'lsp_config'
-- Statusline
require 'statusline'
-- Highlights the yanked characters/lines
vim.cmd [[ augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END ]]
