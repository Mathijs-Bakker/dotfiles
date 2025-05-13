local lspconfig = require 'lspconfig'

lspconfig.gdscript.setup {
  cmd = { 'godot', '--headless', '--editor', '--lsp' },
  filetypes = { 'gd', 'gdscript', 'gdscript3' },
  root_dir = lspconfig.util.root_pattern('project.godot', '.git'),
  on_attach = function(client, bufnr)
    local buf_map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
    end

    buf_map('n', 'gd', vim.lsp.buf.definition)
    buf_map('n', 'K', vim.lsp.buf.hover)
    buf_map('n', '<leader>rn', vim.lsp.buf.rename)
    buf_map('n', '<leader>ca', vim.lsp.buf.code_action)
  end,
}
-- vim.keymap.set('n', '<Leader>sg', function()
-- vim.fn.serverstart '127.0.0.1:6004'
-- end, { noremap = true })
-- local lsp_status = require 'lsp-status'

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- require('lspconfig').gdscript.setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- }

-- npm install -g vim-language-server
-- require('lspconfig').vimls.setup {
-- on_attach = lsp_status.on_attach,
-- capabilities = capabilities,
-- }
