local api = vim.api

local function map(key, vim_lsp_command)
   local bufnr = 0
   local mode = 'n'
   local opts = { noremap=true, silent=true, nowait=true }

   local cmd = '<cmd>lua ' .. vim_lsp_command .. '<CR>'

   api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)

end

local default_keybindings = function()
   -- Show Line Diagnostics
   map('<Leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
   -- Go to Definition:
   map('gd', 'vim.lsp.buf.definition()')
   -- Hover:
   map('K', 'vim.lsp.buf.hover()')
   -- Signature Help:
   map('<C-k>', 'vim.lsp.buf.signature_help()')
   -- Rename:
   map('<leader>rn', 'vim.lsp.buf.rename()')
   -- Go to References:
   map('gr', 'vim.lsp.buf.references()')
end

local custom_keybindings = function()
   default_keybindings()
   -- Go to Declaration:
   map('gD', 'vim.lsp.buf.declaration()')
   -- Implementation:
   map('gi', 'vim.lsp.buf.implementation()')
   -- Type Definition:
   map('<leader>D', 'vim.lsp.buf.type_definition()')
end

require('lspconfig').sumneko_lua.setup({
   Lua = {
      settings = {
         diagnostics = {
            enable = true,
            globals = { "vim" },
         },
      },
   },
   on_attach = default_keybindings
})

require('lspconfig').omnisharp.setup({
   on_attach = custom_keybindings
})

-- local on_attach = function(_, bufnr)
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   require'diagnostic'.on_attach()
--   require'completion'.on_attach()
