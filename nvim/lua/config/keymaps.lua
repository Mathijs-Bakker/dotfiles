-- <C-z> suspends Vim to terminal
-- Disable <C-z> as it's anoying with SKHD keymapings
-- NeoVim has a terminal behavior alternative.
Nnoremap('<C-z>', '<nop>')

-- Reload config/init
Nnoremap('<Leader><Leader>r', ':Reload<CR>')

Nnoremap([['']], [[:luafile init.lua]])
--[[  Movement: --]]
-- Lines up and down:

-- Cmd or D key ->
-- it's a macOS HACK for working with the command key nicely
-- check Kitty's config too, as the CHAR-0x37 key code is dispatched from there.

local super_key = '<CHAR-0x37>'

-- Inoremap(super_key .. 'k <Esc>', ':m .-2<CR>==gi')
-- Inoremap(super_key .. 'j <Esc>', ':m .+1<CR>==gi')

Vnoremap(super_key .. 'k', ":m '<-2<cr>gv=gv")
Vnoremap(super_key .. 'j', ":m '>+1<cr>gv=gv")

Nnoremap(super_key .. 'k', [[:m .-2<CR>==]])
Nnoremap(super_key .. 'j', [[:m .+1<CR>==]])

-- Location List:
-- -- Navigate to next error:
-- Nnoremap('<Leader>l', ':lnext<CR>')
-- Nnoremap('<Leader>h', ':lprevious<CR>')

-- Navigate jump lis>
-- Nnoremap('<S-i>', '<C-i>')
-- Nnoremap('<S-o>', '<C-o>')
-- Nnoremap ('k', [[<expr> (v:count > 5 ? "m'" . v:count : "") . 'k' <cr>]])
-- Nnoremap ([[<expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'])
-- vim.api.noremap([[<expr> k (v:count > 5 ? "m'" . v:count : "") . 'k']])

-- [[ Tabs, Splits, Windows & Buffers: --]]

-- Split navigation:
Nnoremap('<C-h>', '<c-w><c-h>')
Nnoremap('<C-j>', '<c-w><c-j>')
Nnoremap('<C-k>', '<c-w><c-k>')
Nnoremap('<C-l>', '<c-w><c-l>')

-- Easy moving between the buffers:
-- Tnoremap('<A-h>', [[<C-\><C-n><C-w>h]])
-- Tnoremap('<A-j>', [[<C-\><C-n><C-w>j]])
-- Tnoremap('<A-k>', [[<C-\><C-n><C-w>k]])
-- Tnoremap('<A-l>', [[<C-\><C-n><C-w>l]])

-- Nnoremap('<A-h>', '<C-w>h')
-- Nnoremap('<A-j>', '<C-w>j')
-- Nnoremap('<A-k>', '<C-w>k')
-- Nnoremap('<A-l>', '<C-w>l')

-- Window sizing:
-- Resize windows to be basically the same size
Nnoremap('<leader>=', '<C-w>=')

-- Sizing window horizontally
Nnoremap('<c-,>', '<C-W><')
Nnoremap('<c-.>', '<C-W>>')
Nnoremap('<A-,>', '<C-W>5<')
Nnoremap('<A-.>', '<C-W>5>')

-- Sizing window vertically
-- taller
-- Nnoremap('<A-t>', '<C-W>+')
-- shorter
-- Nnoremap('<A-s>', '<C-W>-')

--[[ Custom Vim Behavior: ]]
--

-- Escape:
-- Inoremap('kj', '<Esc>')
-- Vnoremap('kj', '<Esc>')

-- Tnoremap('kj', [[<C-\><C-n>]])

-- Yank last part from current cursor position:
Nnoremap('<S-y>', [[y$]])

-- Center contexts:
Nnoremap('n', [[nzzzv]]) -- doesn't work with engrammer mod
Nnoremap('<S-n>', [[Nzzzv]])
Nnoremap('<S-j>', [[mzJ`z]])

-- Undo Breakpoints:
Inoremap(',', [[,<C-g>u]])
Inoremap('.', [[.<C-g>u]])
Inoremap('!', [[!<C-g>u]])
Inoremap('?', [[?<C-g>u]])

--[[ Misc: ]]
--

-- Remove Whitespaces:
Nnoremap('<leader>sws', [[:%s/\s\+$/<CR>]])

-- Clear Search Highlights:
vim.api.nvim_set_keymap(
  'n',
  '<CR>',
  [[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]],
  { expr = true, noremap = true, silent = true }
)
