TrySource 'lsp.lua'
TrySource 'lsp.omnisharp'
TrySource 'lsp.typescript'
TrySource 'lsp.viml'

-- -- DIAGNOSTICS
-- vim.diagnostic.config {
--   virtual_text = true,
--   signs = true,
--   float = {
--     show_header = true,
--     border = 'rounded',
--     -- source = "always",
--     format = function(diagnostic)
--       if not diagnostic.code and not diagnostic.user_data then
--         return diagnostic.message
--       end

--       local t = vim.deepcopy(diagnostic)
--       local code = diagnostic.code
--       if not code then
--         if not diagnostic.user_data.lsp then
--           return diagnostic.message
--         end

--         code = diagnostic.user_data.lsp.code
--       end
--       if code then
--         t.message = string.format('%s [%s]', t.message, code):gsub('1. ', '')
--       end
--       return t.message
--     end,
--   },
--   severity_sort = true,
--   update_in_insert = false,
-- }

-- local severity_levels = {
--   vim.diagnostic.severity.ERROR,
--   vim.diagnostic.severity.WARN,
--   vim.diagnostic.severity.INFO,
--   vim.diagnostic.severity.HINT,
-- }

-- local get_highest_error_severity = function()
--   for _, level in ipairs(severity_levels) do
--     local diags = vim.diagnostic.get(0, { severity = { min = level } })
--     if #diags > 0 then
--       return level, diags
--     end
--   end
-- end

-- Nnoremap('<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>') -- Diagnostics
-- Nnoremap('dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>') -- Diagnostics Previous

-- vim.keymap.set('n', 'dp', function()
--   vim.diagnostic.goto_prev {
--     severity = get_highest_error_severity(),
--     wrap = true,
--     float = true,
--   }
-- end)

-- vim.keymap.set('n', 'dn', function()
--   vim.diagnostic.goto_next {
--     severity = get_highest_error_severity(),
--     wrap = true,
--     float = true,
--   }
-- end)

-- vim.keymap.set('n', '<Leader>dp', function()
--   vim.diagnostic.goto_prev {
--     wrap = true,
--     float = true,
--   }
-- end)

-- vim.keymap.set('n', '<Leader>dn', function()
--   vim.diagnostic.goto_next {
--     wrap = true,
--     float = true,
--   }
-- end)

-- vim.keymap.set('n', '<Leader>dl', function()
--   vim.diagnostic.open_float(0, { scope = 'line' })
-- end)

-- Nnoremap('<Leader>ll', '<cmd>lua vim.diagnostic.setloclist()<CR>') -- List Location List
-- Nnoremap('<Leader>lf', '<cmd>lua vim.diagnostic.setqflist()<CR>') -- List quickFix

-- -- End Diagnostics

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
      dl = { '[Diagnostics] Display Line Diagnostics' },
      dn = { '[Diagnostics] Goto Next' },
      dp = { '[Diagnostics] Goto Previous' },
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
