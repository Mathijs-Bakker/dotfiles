local lsp_status = require 'plugins.lsp-status'

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- npm install -g vim-language-server
require('lspconfig').vimls.setup {
  on_attach = lsp_status.on_attach,
  capabilities = capabilities,
}
