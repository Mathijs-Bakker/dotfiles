local bufnr = vim.api.nvim_get_current_buf()

-- Rustacean.nvim:
vim.keymap.set('n', '<leader>ca', function()
  vim.cmd.RustLsp 'codeAction'
end, { silent = true, buffer = bufnr, desc = 'Rust: Code Actions' })

vim.keymap.set('n', 'K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end, { silent = true, buffer = bufnr })

vim.keymap.set('n', '<Leader>cb', ':! cargo build<CR>')

vim.keymap.set('n', '<Leader>ct', function()
  vim.cmd.RustLsp 'testables'
end, { silent = true, buffer = bufnr, desc = 'Rust: Testables' })

vim.keymap.set('n', '<Leader>gd', ':Rust externalDocs<CR>')

vim.keymap.set('n', '<Leader>k', function()
  vim.cmd.RustLsp { 'moveItem', 'up' }
end, { silent = true, buffer = bufnr, desc = 'Rust: Move Item Up' })

vim.keymap.set('n', '<Leader>j', function()
  vim.cmd.RustLsp { 'moveItem', 'down' }
end, { silent = true, buffer = bufnr, desc = 'Rust: Move Item Down' })

vim.keymap.set('n', '<Leader>e', function()
  vim.cmd.RustLsp { 'explainError', 'current' }
end, { silent = true, buffer = bufnr, desc = 'Rust: Explain Error' })

vim.keymap.set('n', 'dn', function()
  vim.cmd.RustLsp { 'renderDiagnostic', 'cycle' }
end, { silent = true, buffer = bufnr, desc = 'Rust: Diagnostics Next' })

vim.keymap.set('n', 'dp', function()
  vim.cmd.RustLsp { 'renderDiagnostic', 'cycle_prev' }
end, { silent = true, buffer = bufnr, desc = 'Rust: Diagnostics Prev' })

-- Nvim default overides:
local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<space>f', function()
  vim.vim.lsp.buf.format { async = true }
end, opts)
