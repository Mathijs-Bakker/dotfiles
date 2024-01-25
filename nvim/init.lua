-- Be sure to set leader key first --
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '

require('globals')
require('config')

-- Lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

-- Statusline
require('statusline')

-- Highlights the yanked characters/lines
vim.cmd [[ augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END ]]
