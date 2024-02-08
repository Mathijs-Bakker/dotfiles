local lsp_status = require 'lsp-status'

local home = os.getenv 'HOME'
local omnisharp_bin = home .. '/Repositories/language-servers/omnisharp-osx/run'
local pid = vim.fn.getpid()

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('lspconfig').omnisharp.setup {
  cmd = {
    omnisharp_bin,
    '--languageserver',
    '--hostPID',
    tostring(pid),
  },
  on_attach = lsp_status.on_attach,
  -- capabilities = lsp_status.capabilities
  capabilities = capabilities,
}
