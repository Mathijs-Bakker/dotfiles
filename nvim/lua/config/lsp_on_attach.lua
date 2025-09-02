local function on_attach(client, bufnr)
  print('✅ Attached LSP: ' .. client.name)

  -- Optioneel: bepaalde servers aanpassen
  if client.name == 'gopls' then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  -- Buffer-local keymaps
  local opts = { buffer = bufnr }
  local keymap = vim.keymap.set

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
