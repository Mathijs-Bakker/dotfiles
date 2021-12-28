TrySource 'lsp.lua'
TrySource 'lsp.omnisharp'
TrySource 'lsp.rust'
TrySource 'lsp.typescript'
TrySource 'lsp.viml'

local bufnr = 0
local function buf_set_keymap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end
local function buf_set_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap = true, silent = true }

-- stylua: ignore start
buf_set_keymap('n', 'gtD', 	        '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gtd', 	        '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'gti', 	        '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

buf_set_keymap('n', '<space>D',     '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

buf_set_keymap('n', 'K', 	        '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', '<C-k>', 	    '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

buf_set_keymap('n', '<space>wa',    '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wr',    '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wl',    '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<space>rn',    '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', 'gr', 	        '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

-- buf_set_keymap('n', '<space>d', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '<space>d',     '<Cmd>lua vim.diagnostic.show()<CR>', opts)
buf_set_keymap('n', 'dn',           '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', 'dp',           '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>l',     '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
buf_set_keymap('n', '<space>qf',     '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
-- stylua: ignore end
