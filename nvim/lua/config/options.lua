-- Option Scopes:
local o = vim.o -- editor global
local bo = vim.bo -- buffer
local wo = vim.wo -- window
local cmd = vim.cmd

o.fileencoding = "utf-8"

--[[ APPEARANCE --]]
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

-- Status:
o.showmode = false

-- Split like this:
o.splitright = true
o.splitbelow = true
o.equalalways = true

-- Wildcard Menu:
o.wildmode = "longest,full"
o.wildoptions = 'pum'

-- Popup menu transparency:
o.pumblend = 17


--[[ FORMATTING --]]
-- Tab Spacing:
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
o.shiftround = true
bo.expandtab = true

bo.autoindent = true
bo.smartindent = true
bo.cindent = true

--[[ SEARCH --]]
o.ignorecase = true
o.smartcase = true

--[[ MISC --]]

-- Completion Timers:
o.updatetime = 300
--o.timeoutlen = 100

-- Hide, don't close buffers:
o.hidden = true
-- Matching brackets:
o.showmatch = true

-- Avoid hit-enter caused by file messages:
o.shortmess = "fmlwxsi"

-- TODO: Need to get into language support
-- bo.spelllang = "en_us,nl_NL,es_ES"

bo.swapfile = false

-- I smell a rat:
o.mouse = "nv"

-- Use clipboard for ALL ops:
o.clipboard = "unnamedplus"
