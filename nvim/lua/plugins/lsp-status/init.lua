local lsp_status = require('lsp-status')
lsp_status.register_progress()

local status = {}

status.activate = function()
  lsp_status.config {
    select_symbol = status.select_symbol,

    indicator_errors = '',
    indicator_warnings = '',
    indicator_info = '',
    indicator_hint = '',
    indicator_ok = '',
    spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
  }

  lsp_status.register_progress()
end

status.select_symbol = function(cursor_pos, symbol)
  if symbol.valueRange then
    local value_range = {
      ["start"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[1])
      },
      ["end"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[2])
      }
    }

    return require("lsp-status.util").in_range(cursor_pos, value_range)
  end
end

status.on_attach = function(client)
  lsp_status.on_attach(client)

  vim.cmd [[augroup lsp_status]]
  vim.cmd [[  autocmd CursorHold,BufEnter <buffer> lua require('lsp-status').update_current_function()]]
  vim.cmd [[augroup END]]
end

return status

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
