local nvim_lsp = require('nvim_lsp')
local nvim_status = require('lsp-status')
local completion = require('completion')

local status = require('tj.lsp_status')

-- Can set this lower if needed.
-- require('vim.lsp.log').set_level("debug")
-- require('vim.lsp.log').set_level("trace")

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local setup_custom_diagnostics = function()
  Diagnostic = require('vim.lsp.actions').Diagnostic
  Location = require('vim.lsp.actions').Location

  vim.lsp.callbacks["textDocument/publishDiagnostics"] = Diagnostic.handle_publish_diagnostics.with {
    should_underline = false,
    update_in_insert = false
  }

  mapper(
    'n',
    '<leader>dn',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_next_diagnostic()<CR>'
  )

  mapper(
    'n',
    '<leader>dp',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_prev_diagnostic()<CR>'
  )
end

-- Turn on status.
status.activate()

local custom_attach = function(client)
  completion.on_attach(client)
  status    .on_attach(client)

  if false then
    pcall(setup_custom_diagnostics)
  end

  -- mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper('n', '<space>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')

  -- if not vim.api.nvim_buf_get_keymap(0, 'n')['K'] then
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'lua' then
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  end

  mapper('n', '<space>sl', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')

  mapper(
    'n',
    '<space>gd',
    '<cmd>lua vim.lsp.buf.definition { callbacks = { Location.jump_first, Location.highlight.with { timeout = 300 } } }<CR>'
  )

  mapper(
    'n',
    '<space>pd',
    '<cmd>lua vim.lsp.buf.definition { callbacks = Location.preview.with { lines_below = 5 } }<CR>'
  )

  -- Rust is currently the only thing w/ inlay hints
  if vim.api.nvim_buf_get_option(0, 'filetype') == 'rust' then
    vim.cmd [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { aligned = true, prefix = " » " }]]
  end

  mapper('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

nvim_lsp.pyls.setup({
  enable = true,
  plugins = {
    pyls_mypy = {
      enabled = true,
      live_mode = false
    }
  },
  on_attach = custom_attach
})

nvim_lsp.vimls.setup({
  on_attach = custom_attach,
})

-- Load lua configuration from nlua.
require('nlua.lsp.nvim').setup(nvim_lsp, {
  on_attach = custom_attach,

  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",

    -- Custom
    "RELOAD",
  }
})

if true then
  nvim_lsp.tsserver.setup({
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx"
    },
    on_attach = custom_attach
  })
else
  nvim_lsp.sourcegraph_ts.setup {
    on_attach = custom_attach
  }
end

nvim_lsp.clangd.setup({
  cmd = {"clangd", "--background-index"},
  on_attach = custom_attach,

  -- Required for lsp-status
  init_options = {
    clangdFileStatus = true
  },
  callbacks = nvim_status.extensions.clangd.setup(),
  capabilities = nvim_status.capabilities,
})

nvim_lsp.rust_analyzer.setup({
  cmd = {"rust-analyzer"},
  filetypes = {"rust"},
  on_attach = custom_attach,
})
