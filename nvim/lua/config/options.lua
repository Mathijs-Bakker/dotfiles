O.fileencoding = "utf-8"

Cmd('language en_US')

--[[ APPEARANCE --]]
-- Gruvbox:
Cmd([[colorscheme gruvbox]])
Cmd('set termguicolors')

-- Colums, gutters and rulers:
Wo.number = true
Wo.relativenumber = true
Wo.signcolumn = "yes"
Wo.colorcolumn = "80,120"
Wo.cursorline = true
O.scrolloff = 5

-- Status:
O.showmode = false

-- Split like this:
O.splitright = true
O.splitbelow = true
O.equalalways = true

-- Wildcard Menu:
O.wildmode = "longest,full"
O.wildoptions = 'pum'

-- Popup menu transparency:
O.pumblend = 17


--[[ FORMATTING --]]
-- Tab Spacing:
Bo.tabstop = 4
Bo.softtabstop = 4
Bo.shiftwidth = 4
O.shiftround = true
Bo.expandtab = true

Bo.autoindent = true
Bo.smartindent = true
Bo.cindent = true

--[[ SEARCH --]]
O.ignorecase = true
O.smartcase = true

--[[ MISC --]]

-- Completion Timers:
O.updatetime = 300
--o.timeoutlen = 100

-- Hide, don't close buffers:
O.hidden = true
-- Matching brackets:
O.showmatch = true

-- Avoid hit-enter caused by file messages:
O.shortmess = "fmlwxsi"

-- TODO: Need to get into language support
-- bo.spelllang = "en_us,nl_NL,es_ES"

Bo.swapfile = false

-- I smell a rat:
O.mouse = "nv"

-- Use clipboard for ALL ops:
O.clipboard = "unnamedplus"
