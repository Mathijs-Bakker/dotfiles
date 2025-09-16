-- ~/.config/nvim/lua/lazy-plugins/lsp_godot.lua
return {
  'Mathijs-Bakker/godot-lsp.nvim',
  enabled = false,
  branch = 'development',
  dependencies = { 'neovim/nvim-lspconfig', 'rcarriga/nvim-dap-ui' },
  config = function()
    local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
    if not lspconfig_status_ok then
      vim.notify('nvim-lspconfig not found. Please ensure it is installed and loaded.', vim.log.levels.ERROR)
      return
    end

    local status_ok, godot_lsp = pcall(require, 'godot-lsp')
    if not status_ok then
      vim.notify('godot-lsp.nvim not found, install it with :Lazy sync', vim.log.levels.ERROR)
      return
    end

    -- Custom setup to handle Godot LSP limitations
    local function custom_on_attach(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      client.server_capabilities.workspace = {
        configuration = false,
      }
    end

    lspconfig.gdscript.setup {
      cmd = { 'ncat', 'localhost', '6005' },
      filetypes = { 'gdscript' },
      on_attach = custom_on_attach,
      settings = {
        godot_lsp = {
          debug = true,
        },
      },
    }

    godot_lsp.setup {
      skip_godot_check = true,
      debug_logging = true,
      dap = true,
      on_attach = custom_on_attach, -- Apply the same capability fixes to godot_lsp setup
      keymaps = {
        definition = 'gd',
        declaration = 'gD',
        type_definition = 'gt',
        hover = 'K',
        code_action = '<leader>ca',
        completion = '<C-x><C-o>',
        diagnostic_open_float = '<leader>cd',
        diagnostic_goto_next = ']d',
        diagnostic_goto_prev = '[d',
        references = 'gr',
        rename = '<leader>rn',
        workspace_symbols = '<leader>ws',
        format = '<leader>f',
        dap_continue = '<F5',
        dap_toggle_breakpoint = '<F9',
        dap_step_over = '<F10',
        dap_step_into = '<F11',
        dap_step_out = '<F12',
        dap_ui = '<leader>du',
      },
    }
  end,
}
