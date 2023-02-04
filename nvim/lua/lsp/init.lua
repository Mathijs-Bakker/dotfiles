TrySource 'lsp.lua'
TrySource 'lsp.omnisharp'
TrySource 'lsp.typescript'
TrySource 'lsp.viml'

vim.diagnostic.config {
  virtual_text = true,
}

local function buf_set_option(...)
  vim.api.nvim_buf_set_option(0, ...)
end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- stylua: ignore start
Nnoremap('gD', 	'<cmd>lua vim.lsp.buf.declaration()<CR>') -- Goto Declaration
Nnoremap('gd', 	'<cmd>lua vim.lsp.buf.definition()<CR>') -- Goto Definition

Nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>') -- Well, K is K
TrySource 'lsp.rust' -- Have this after K mapping so it gets remapped

ts_map('gr', 	'lsp_references') -- Goto References
ts_map('gI', 	'lsp_implementations') -- Goto Implementations

Nnoremap('<Leader>cr', 	'<cmd>lua vim.lsp.buf.rename()<CR>') -- Code Rename
vim.keymap.set({'v', 'n'}, '<Leader>ca', vim.lsp.buf.code_action)

Inoremap('<C-s>', 	'<cmd>lua vim.lsp.buf.signature_help()<CR>') -- Show Signature

ts_map('<Leader>wd', 'lsp_document_symbols') -- Workspace = Document Symbols
ts_map('<Leader>ww', 'lsp_workspace_symbols') -- Workspace Symbols

Nnoremap('<Leader>wl', 	'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
Nnoremap('<Leader>wa', 	'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
Nnoremap('<Leader>wr', 	'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')

-- Diagnostics:

Nnoremap('<Leader>d', 	'<cmd>lua vim.diagnostic.open_float()<CR>') -- Diagnostics
Nnoremap('dp', 		'<cmd>lua vim.diagnostic.goto_prev()<CR>') -- Diagnostics Previous
Nnoremap('dn', 		'<cmd>lua vim.diagnostic.goto_next()<CR>') -- Diagnostics Next
-- ts_map('<Leader>dl', 'diagnostics')
-- Nnoremap('<Leader>ld', '<cmd>Telescope diagnostics<CR>') -- List Diagnotics
Nnoremap('<Leader>ll', 	'<cmd>lua vim.diagnostic.setloclist()<CR>') -- List Location List
Nnoremap('<Leader>lf', 	'<cmd>lua vim.diagnostic.setqflist()<CR>') -- List quickFix

local whichkey = require 'which-key'
whichkey.register {
  g = {
    name = 'LSP', -- optional group name
      D = { '[LSP] Goto Declaration' },
      I = { '[LSP] Show Implementations' },
      K = { '[LSP] Display Hover Info' },
      d = { '[LSP] Goto definition' },
      r = { '[LSP] Show references' },
  },
  ['<Leader>'] = {
    c = {
      name = 'LSP',
        a = { '[LSP] Code Actions' },
	ca = { '[LSP] Code Actions All' },
        r = { '[LSP] Rename Symbol' },
    },
    w = {
      name = 'LSP',
        a = { 'Add Workspace Folder' },
        l = { 'List Workspace Folders' },
        r = { 'Remove Workspace Folders' },
        d = { 'List Document Symbols in Current Document' },
        w = { 'List Document Symbols in Current Workspace' },
    },
    name = 'Diagnostics',
      d = { '[Diagnostics] Display Line Diagnostics' },
      l = {
	name = 'Diagnostics',
	  d = { '[Diagnostics] List Diagnostics' },
	  f = { '[Diagnostics] Quickfix List' },
	  l = { '[Diagnostics] Location List' },
    },
  },
  d = {
    name = 'Diagnostics',
      n = { '[Diagnostics] Goto Next' },
      p = { '[Diagnostics] Goto Previous' },
  },
-- ts_map('<Leader>wd', 'lsp_document_symbols')
-- ts_map('<Leader>ww', 'lsp_workspace_symbols')
}
-- stylua: ignore end
