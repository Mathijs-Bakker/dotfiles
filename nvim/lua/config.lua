-- Option Scopes:
local o = vim.o -- editor
local bo = vim.bo -- buffer
local wo = vim.wo -- window
local cmd = vim.cmd

o.fileencoding = "utf-8"

--[[ Appearance --]]
-- Gruvbox:
cmd('autocmd vimenter * colorscheme gruvbox')
cmd('set termguicolors')

-- Rulers:
wo.rnu = true
wo.number = true -- set numbered lines

-- HL current line:
wo.cursorline = true -- Enable highlighting of the current line

-- Visual line to mark 80 chars
wo.colorcolumn = "80,120"

cmd('set scrolloff=5')
cmd('set mouse=nv')

cmd('set ts=4') -- Insert 2 spaces for a tab
cmd('set sw=4') -- Change the number of space characters inserted for indentation
bo.expandtab = true -- Converts tabs to spaces
bo.smartindent = true -- Makes indenting smart
o.showtabline = 2 -- Always show tabs
o.showmode = false -- We don't need to see things like -- INSERT -- anymore
o.backup = false -- This is recommended by coc
o.writebackup = false -- This is recommended by coc
wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.updatetime = 300 -- Faster completion
--o.timeoutlen = 100

--[[
filetype plugin indent on

" Appearance: {{{

    " Rulers: {{{
        set rnu                             " Relative numbering
        set nu                              " Line numbering
    " }}}
--]]
