-- Plenary Busted:
Nnoremap('<Leader>t', '<Plug>PlenaryWriteAndRunTestFile<CR>')

-- Reload config/init
Nnoremap ('<Leader><Leader>r', ':Reload<CR>')

Nnoremap([['']], [[:luafile init.lua]])
--[[  Movement: --]]

-- Lines up and down:
Inoremap('<C-j> <Esc>', ':m .+1<CR>==gi')
Inoremap('<C-k> <Esc>', ':m .-2<CR>==gi')
-- 'gv' to hl back
Vnoremap('<C-j>', ":m '>+1<cr>gv=gv")
Vnoremap('<C-k>', ":m '<-2<cr>gv=gv")

-- Navigate to next error:
Nnoremap('<leader>l', ':lnext<CR>')
Nnoremap('<leader>h', ':lprevious<CR>')

-- Navigate jump list
-- Nnoremap('<S-i>', '<C-i>')
-- Nnoremap('<S-o>', '<C-o>')

-- [[ Tabs, Splits, Windows & Buffers: --]]

-- Tab switching:
Nnoremap('<right>', 'gt')
Nnoremap('<left>', 'gt')

-- Split navigation:
Nnoremap('<c-h>', '<c-w><c-h>')
Nnoremap('<c-j>', '<c-w><c-j>')
Nnoremap('<c-k>', '<c-w><c-k>')
Nnoremap('<c-l>', '<c-w><c-l>')

-- Easy moving between the buffers:
Tnoremap('<A-h>', [[<C-\><C-n><C-w>h]])
Tnoremap('<A-j>', [[<C-\><C-n><C-w>j]])
Tnoremap('<A-k>', [[<C-\><C-n><C-w>k]])
Tnoremap('<A-l>', [[<C-\><C-n><C-w>l]])

Nnoremap('<A-h>', '<C-w>h')
Nnoremap('<A-j>', '<C-w>j')
Nnoremap('<A-k>', '<C-w>k')
Nnoremap('<A-l>', '<C-w>l')

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
Nnoremap('<A-t>', '<C-W>+')
-- shorter
Nnoremap('<A-s>', '<C-W>-')

-- Escape:
Inoremap('kj', '<Esc>')
Vnoremap('kj', '<Esc>')

Tnoremap('kj', [[<C-\><C-n>]])

-- Remove Whitespaces:
Nnoremap('<leader>sws', [[:%s/\s\+$/<CR>]])

-- Clear Search Highlights:
vim.api.nvim_set_keymap('n', '<CR>',
[[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]],
{ expr = true, noremap = true, silent = true })

-- Explorer:
Nnoremap('<Leader>e', ':Lexplore<CR>')
