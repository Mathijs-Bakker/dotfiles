local M = {}

function M.on_attach(client, bufnr)
  print 'ATTACH!!!'
  -- Disable LSP formatting for gopls
  if client.name == 'gopls' then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  -- Diagnostics
  keymap('n', '<space>e', vim.diagnostic.open_float, opts)
  keymap('n', '[d', function()
    vim.diagnostic.jump { count = -1, float = true }
  end, vim.tbl_extend('force', opts, { desc = 'Prev diagnostic' }))
  keymap('n', ']d', function()
    vim.diagnostic.jump { count = 1, float = true }
  end, vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
  keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

  -- LSP
  keymap('n', 'gD', vim.lsp.buf.declaration, opts)
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'K', vim.lsp.buf.hover, opts)
  keymap('n', 'gi', vim.lsp.buf.implementation, opts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
  keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
  keymap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  keymap('n', 'gr', vim.lsp.buf.references, opts)

  keymap('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

return M
