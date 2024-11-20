vim.o.fileencoding = 'utf-8'

vim.cmd 'language en_US'

-- Colums, gutters and rulers:
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.colorcolumn = '80,120'
vim.wo.cursorline = true
vim.o.scrolloff = 5

-- Status:
vim.o.showmode = false

-- Split like this:
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.equalalways = true

-- Wildcard Menu:
vim.o.wildmode = 'longest,full'
vim.o.wildoptions = 'pum'

-- Popup menu transparency:
vim.o.pumblend = 17

--[[ FORMATTING --]]
-- Tab Spacing:
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
--vim.o.shiftround = true
vim.bo.expandtab = true

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.cindent = true

--[[ SEARCH --]]
vim.o.ignorecase = true
vim.o.smartcase = true

--[[ MISC --]]

-- Completion Timers:
vim.o.updatetime = 300
--o.timeoutlen = 100

-- Hide, don't close buffers:
vim.o.hidden = true
-- Matching brackets:
vim.o.showmatch = true

-- Avoid hit-enter caused by file messages:
vim.o.shortmess = 'ofmlwxsi'

-- TODO: Need to get into language support
-- vim.bo.spelllang = "en_us,nl_NL,es_ES"

vim.bo.swapfile = false

-- I smell a rat:
vim.o.mouse = 'nv'

-- Use clipboard for ALL ops:
vim.o.clipboard = 'unnamedplus'
