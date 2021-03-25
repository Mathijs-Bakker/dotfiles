-- Option Scopes:
local o = vim.o -- editor global
local bo = vim.bo -- buffer
local wo = vim.wo -- window
local cmd = vim.cmd

o.fileencoding = "utf-8"

--[[ Appearance --]]
-- Gruvbox:
cmd('autocmd vimenter * colorscheme gruvbox')
cmd('set termguicolors')

-- Colums, gutters and rulers:
wo.number = true
wo.relativenumber = true
wo.signcolumn = "yes"
wo.colorcolumn = "80,120"
wo.cursorline = true
o.scrolloff = 5

-- I smell a rat:
o.mouse = "nv"

-- Use clipboard for ALL ops:
o.clipboard = "unnamedplus"

-- Tab Spacing:
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
o.shiftround = true
bo.expandtab = true

bo.smartindent = true -- Makes indenting smart
-- o.showtabline = 2 -- Always show tabs
o.showmode = false -- We don't need to see things like -- INSERT -- anymore

-- Performance:
o.updatetime = 300 -- Faster completion
--o.timeoutlen = 100

-- Avoid hit-enter caused by file messages:
o.shortmess = "fmlwxsi"
