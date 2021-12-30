TrySource 'lsp.lua'
TrySource 'lsp.omnisharp'
TrySource 'lsp.rust'
TrySource 'lsp.typescript'
TrySource 'lsp.viml'

local function buf_set_option(...)
  vim.api.nvim_buf_set_option(0, ...)
end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- stylua: ignore start
Nnoremap('gD', 	'<cmd>lua vim.lsp.buf.declaration()<CR>')
Nnoremap('gd', 	'<cmd>lua vim.lsp.buf.definition()<CR>')
Nnoremap('K', 	'<cmd>lua vim.lsp.buf.hover()<CR>')

ts_map('gr', 	'lsp_references')
ts_map('gI', 	'lsp_implementations')

Nnoremap('<Leader>cr', 	'<cmd>lua vim.lsp.buf.rename()<CR>')
ts_map('<Leader>ca', 	'lsp_code_actions')

Inoremap('<C-s>', 	'<cmd>lua vim.lsp.buf.signature_help()<CR>')

ts_map('<Leader>wd', 'lsp_document_symbols')
ts_map('<Leader>ww', 'lsp_workspace_symbols')

Nnoremap('<Leader>wl', 	'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
Nnoremap('<Leader>wa', 	'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
Nnoremap('<Leader>wr', 	'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')

-- Diagnostics:

Nnoremap('<Leader>d', 	'<cmd>lua vim.diagnostic.open_float()<CR>')
Nnoremap('dn', 		'<cmd>lua vim.diagnostic.goto_prev()<CR>')
Nnoremap('dp', 		'<cmd>lua vim.diagnostic.goto_next()<CR>')
Nnoremap('<Leader>ll', 	'<cmd>lua vim.diagnostic.setloclist()<CR>')
Nnoremap('<Leader>lf', 	'<cmd>lua vim.diagnostic.setqflist()<CR>')

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
