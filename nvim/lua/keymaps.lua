-- Plenary Busted:
   nnoremap('<Leader>t', '<Plug>PlenaryWriteAndRunTestFile<CR>')

--[[  Movement: --]]

-- Lines up and down:
    inoremap('<C-j> <Esc>', ':m .+1<CR>==gi')
    inoremap('<C-k> <Esc>', ':m .-2<CR>==gi')
    -- 'gv' to hl back 
    vnoremap('<C-j>', ":m '>+1<cr>gv=gv")
    vnoremap('<C-k>', ":m '<-2<cr>gv=gv")

-- Navigate to next error:
	nnoremap('<leader>l', ':lnext<CR>')
        nnoremap('<leader>h', ':lprevious<CR>')

-- [[ Tabs, Splits, Windows & Buffers: --]]

-- Tab switching:
        nnoremap('<right>', 'gt')
        nnoremap('<left>', 'gt')

-- Split navigation:
        nnoremap('<c-h>', '<c-w><c-h>')
        nnoremap('<c-j>', '<c-w><c-j>')
        nnoremap('<c-k>', '<c-w><c-k>')
        nnoremap('<c-l>', '<c-w><c-l>')

-- Easy moving between the buffers:
       tnoremap('<A-h>', '<C-\\><C-n><C-w>h')
       tnoremap('<A-j>', '<C-\\><C-n><C-w>j')
       tnoremap('<A-k>', '<C-\\><C-n><C-w>k')
       tnoremap('<A-l>', '<C-\\><C-n><C-w>l')

       nnoremap('<A-h>', '<C-w>h')
       nnoremap('<A-j>', '<C-w>j')
       nnoremap('<A-k>', '<C-w>k')
       nnoremap('<A-l>', '<C-w>l')

-- Window sizing:
       -- Resize windows to be basically the same size
        nnoremap('<leader>=', '<C-w>=')

      -- Sizing window horizontally
        nnoremap('<c-,>', '<C-W><')
        nnoremap('<c-.>', '<C-W>>')
        nnoremap('<A-,>', '<C-W>5<')
        nnoremap('<A-.>', '<C-W>5>')

      -- Sizing window vertically
        -- taller
        nnoremap('<A-t>', '<C-W>+')
        -- shorter
        nnoremap('<A-s>', '<C-W>-')

-- Escape:
inoremap('kj', '<Esc>')
vnoremap('kj', '<Esc>')

-- Remove Whitespaces:
nnoremap('<leader>sws', ':%s/\\s\\+$//<CR>')

-- Clear Search Highlights:
vim.api.nvim_set_keymap('n', '<CR>',
	'{-> v:hlsearch ? ":nohl\\<CR>" : "\\<CR>"}()',
	{ expr = true, noremap = true, silent = true })

-- Explorer: 
nnoremap('<Leader>e', ':Lexplore<CR>')

--[[
" Source This File: {{{

    function! s:save_and_exec() abort
      if &filetype == 'vim'
        :silent! write
        :source %
      elseif &filetype == 'lua'
        :silent! write
        :luafile %
      endif

      return
    endfunction
    nnoremap <leader><leader>x :call <sid>save_and_exec()<cr>
" }}}
--]]
