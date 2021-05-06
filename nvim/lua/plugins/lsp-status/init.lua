local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require('lspconfig')

-- Examples:
-- Some arbitrary servers
-- lspconfig.clangd.setup({
--   handlers = lsp_status.extensions.clangd.setup(),
--   init_options = {
--     clangdFileStatus = true
--   },
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })

-- lspconfig.pyls_ms.setup({
--   handlers = lsp_status.extensions.pyls_ms.setup(),
--   settings = { python = { workspaceSymbols = { enabled = true }}},
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })

-- lspconfig.ghcide.setup({
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })
-- lspconfig.rust_analyzer.setup({
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })
