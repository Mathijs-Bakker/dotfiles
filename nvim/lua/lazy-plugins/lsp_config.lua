return {

  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp_lsp = require 'cmp_nvim_lsp'
    local capabilities =
      vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    local lspconfig = require 'lspconfig'
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
          },
        },
      },
    }

    require('lspconfig').clangd.setup {}
    require('lspconfig').slint_lsp.setup {}

    -- require('lspconfig').gdscript.setup {
    -- -- cmd = { 'godot', '--headless', '--editor', '--lsp', '--path', vim.fn.getcwd() },
    -- cmd = { 'ncat', '127.0.0.1', '6005' },
    -- filetypes = { 'gd', 'gdscript', 'gdscript3' },
    -- root_dir = require('lspconfig.util').root_pattern 'project.godot',
    -- on_attach = function(client, bufnr)
    --   local buf_map = function(mode, lhs, rhs)
    --     vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
    --   end
    --   buf_map('n', 'gd', vim.lsp.buf.definition)
    --   buf_map('n', 'K', vim.lsp.buf.hover)
    --   buf_map('n', '<leader>rn', vim.lsp.buf.rename)
    --   buf_map('n', '<leader>ca', vim.lsp.buf.code_action)
    -- end,
    -- }

    require('lspconfig').gdscript.setup { capabilities = capabilities }

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end,
}
