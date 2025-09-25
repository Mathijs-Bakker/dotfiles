local enable = vim.lsp.enable
local config = vim.lsp.config
-- local keymaps = require 'config.keymaps_lsp'

config['lua_ls'] = {
  -- on_attach = keymaps.on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
      },
    },
  },
}
enable 'lua_ls'

config['superhtml'] = {
  -- on_attach = keymaps.on_attach,
  filetypes = { 'html' },
  cmd = { 'superhtml', '--stdio' },
  root_markers = { '.git', '.' },
}
enable 'superhtml'

enable 'gopls'
enable 'clangd'
enable 'jsonlsp'
enable 'slint_lsp'
