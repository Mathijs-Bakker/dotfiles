local lsp_group = vim.api.nvim_create_augroup('UserLspConfig', {})
local map = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,
  callback = function(ev)
    local opts = function(desc)
      return { buffer = ev.buf, silent = true, desc = desc }
    end

    -- Diagnostics
    map('n', '<space>e', vim.diagnostic.open_float, opts 'Diagnostic open')

    map('n', '[d', function()
      vim.diagnostic.jump { count = -1, float = true }
    end)
    opts 'Prev diagnostic'

    map('n', ']d', function()
      vim.diagnostic.jump { count = 1, float = true }
    end)
    opts 'Next diagnostic'

    map('n', 'dp', function()
      vim.diagnostic.jump { count = -1, float = true, severity = 'ERROR' }
    end)
    opts 'Prev Error'

    map('n', 'dn', function()
      vim.diagnostic.jump { count = 1, float = true, severity = 'ERROR' }
    end)
    opts 'Next Error'

    map('n', '<space>q', vim.diagnostic.setloclist, opts 'Set loclist')

    -- Keymaps with descriptions
    map('n', 'gd', vim.lsp.buf.definition, opts 'Go to definition')
    map('n', 'K', vim.lsp.buf.hover, opts 'Hover documentation')
    map('n', 'gi', vim.lsp.buf.implementation, opts 'Go to implementation')
    map('n', '<leader>rn', vim.lsp.buf.rename, opts 'Rename symbol')
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts 'Code actions')
    map('n', 'gr', vim.lsp.buf.references, opts 'List references')
    map('n', '<leader>cf', function()
      vim.lsp.buf.format { async = true }
    end, opts 'Format buffer')
  end,
})
