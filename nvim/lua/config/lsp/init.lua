-- Setup language servers.
require 'config.lsp.lua'
require 'config.lsp.omnisharp'
require 'config.lsp.typescript'
require 'config.lsp.viml'
require 'config.lsp.godot'

function ts_map(key, picker_f)
  local rhs = string.format(":lua require'config.telescope.pickers'.%s()<CR>", picker_f)

  local opts = {
    noremap = true,
    silent = true,
  }
  vim.api.nvim_set_keymap('n', key, rhs, opts)
  -- vim.api.nvim_buf_set_keymap(0, 'n', key, rhs, opts)
end

-- LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local function buf_set_option(...)
  vim.api.nvim_buf_set_option(0, ...)
end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- stylua: ignore start
require 'config.lsp.rust' -- Have this after K mapping so it gets remapped

ts_map('gr', 	'lsp_references') -- Goto References
ts_map('gI', 	'lsp_implementations') -- Goto Implementations

ts_map('<Leader>wd', 'lsp_document_symbols') -- Workspace = Document Symbols
ts_map('<Leader>ww', 'lsp_workspace_symbols') -- Workspace Symbols

  
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
