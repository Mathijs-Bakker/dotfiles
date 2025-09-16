local set = vim.keymap.set

-- GODOT:
set('n', '<Leader>sg', function()
  vim.fn.serverstart '127.0.0.1:6004'
end, { noremap = true })

set('n', [['']], [[:luafile init.lua]])
--[[  Movement: --]]
-- Lines up and down:

-- Cmd or D key ->
-- it's a macOS HACK for working with the command key nicely
-- check Kitty's config too, as the CHAR-0x37 key code is dispatched from there.
local super_key = '<CHAR-0x37>'

set('v', super_key .. 'k', ":m '<-2<cr>gv=gv")
set('v', super_key .. 'j', ":m '>+1<cr>gv=gv")
set('n', super_key .. 'k', [[:m .-2<CR>==]])
set('n', super_key .. 'j', [[:m .+1<CR>==]])

set('i', '<C-j>', '<Esc>:m .+1<CR>==gi') -- Glove80
set('i', '<A-C-k>', ' <Esc>:m .-2<CR>==gi')

set('v', '<C-k>', ":m '<-2<cr>gv=gv")
set('v', '<C-j>', ":m '>+1<cr>gv=gv")

set('n', '<C-k>', [[:m .-2<CR>==]])
set('n', '<C-j>', [[:m .+1<CR>==]]) -- end Glove80

-- [[ Tabs, Splits, Windows & Buffers: --]]

-- Split navigation:
set('n', '<C-h>', '<c-w><c-h>')
set('n', '<C-j>', '<c-w><c-j>')
set('n', '<C-k>', '<c-w><c-k>')
set('n', '<C-l>', '<c-w><c-l>')

-- Yank last part from current cursor position:
set('n', '<S-y>', [[y$]])

-- Glove80 engrammer map
-- Delete lines: 'dl' has same behavior as 'dd'
set('n', 'dl', 'dd')

-- Write Buffer
set('n', '<Leader>w', [[:w<CR>]])

-- Center contexts:
set('n', 'n', [[nzzzv]]) -- doesn't work with engrammer mod
set('n', '<S-n>', [[Nzzzv]])
set('n', '<S-j>', [[mzJ`z]])

-- Undo Breakpoints:
set('i', ',', [[,<C-g>u]])
set('i', '.', [[.<C-g>u]])
set('i', '!', [[!<C-g>u]])
set('i', '?', [[?<C-g>u]])

--[[ Misc: ]]

-- Remove Whitespaces:
set('n', '<leader>sws', [[:%s/\s\+$/<CR>]])

-- Clear Search Highlights:
set('n', '<CR>', [[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], { expr = true, noremap = true, silent = true })

set('n', '<space>cs', ':lua vim.fn.setreg("/", "")<CR>', { noremap = true })
