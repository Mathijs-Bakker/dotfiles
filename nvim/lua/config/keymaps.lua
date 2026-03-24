local set = vim.keymap.set

-- Quickfix
set('n', '<leader>cl', ':ccl<CR>', { desc = '`:ccl[ose]` close quickfix window' })
set('n', '<leader>co', ':cope<CR>', { desc = '`:cope[n]` open quickfix window' })

-- Godot
set('n', '<leader>sg', function()
  vim.fn.serverstart '127.0.0.1:6004'
end, { noremap = true, desc = 'start Godot RPC server on 127.0.0.1:6004' })

set('n', [['']], [[:luafile init.lua]], { desc = 'reload init.lua' })

-- Movement
-- it's a macOS HACK for working with the command key nicely
-- check Kitty's config too, as the CHAR-0x37 key code is dispatched from there.
local super_key = '<CHAR-0x37>'

set('v', super_key .. 'k', ":m '<-2<cr>gv=gv", { desc = 'move selection up' })
set('v', super_key .. 'j', ":m '>+1<cr>gv=gv", { desc = 'move selection down' })
set('n', super_key .. 'k', [[:m .-2<CR>==]], { desc = 'move line up' })
set('n', super_key .. 'j', [[:m .+1<CR>==]], { desc = 'move line down' })

set('i', '<C-j>', '<Esc>:m .+1<CR>==gi', { desc = 'move line down' }) -- Glove80
set('i', '<A-C-k>', ' <Esc>:m .-2<CR>==gi', { desc = 'move line up' })
set('v', '<C-k>', ":m '<-2<cr>gv=gv", { desc = 'move selection up' })
set('v', '<C-j>', ":m '>+1<cr>gv=gv", { desc = 'move selection down' })

-- Windows
set('n', '<C-h>', '<c-w><c-h>', { desc = 'focus left split' })
set('n', '<C-j>', '<c-w><c-j>', { desc = 'focus lower split' })
set('n', '<C-k>', '<c-w><c-k>', { desc = 'focus upper split' })
set('n', '<C-l>', '<c-w><c-l>', { desc = 'focus right split' })

-- Editing
set('n', '<S-y>', [[y$]], { desc = 'yank to end of line' })

-- Glove80 engrammer map
-- Delete lines: 'dl' has same behavior as 'dd'
set('n', 'dl', 'dd', { desc = 'delete line' })

-- Write Buffer
set('n', '<leader>w', [[:w<CR>]], { desc = 'write buffer' })

-- Center contexts:
set('n', 'n', [[nzzzv]], { desc = 'next search result centered' }) -- doesn't work with engrammer mod
set('n', '<S-n>', [[Nzzzv]], { desc = 'previous search result centered' })
set('n', '<S-j>', [[mzJ`z]], { desc = 'join lines and keep cursor position' })

-- Undo Breakpoints:
set('i', ',', [[,<C-g>u]], { desc = 'insert comma with undo breakpoint' })
set('i', '.', [[.<C-g>u]], { desc = 'insert period with undo breakpoint' })
set('i', '!', [[!<C-g>u]], { desc = 'insert exclamation mark with undo breakpoint' })
set('i', '?', [[?<C-g>u]], { desc = 'insert question mark with undo breakpoint' })

-- Misc
set('n', '<leader>sws', [[:%s/\s\+$/<CR>]], { desc = 'strip trailing whitespace' })

-- Clear Search Highlights:
set('n', '<CR>', [[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], {
  expr = true,
  noremap = true,
  silent = true,
  desc = 'clear search highlight or press Enter',
})

set('n', '<space>cs', ':lua vim.fn.setreg("/", "")<CR>', { noremap = true, desc = 'clear search register' })
