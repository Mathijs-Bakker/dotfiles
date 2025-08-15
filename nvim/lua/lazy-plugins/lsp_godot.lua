-- ~/.config/nvim/lua/lazy-plugins/lsp_godot.lua
return {
  'Mathijs-Bakker/godot-lsp.nvim',
  branch = 'development',
  dependencies = { 'neovim/nvim-lspconfig' },
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

    godot_lsp.setup {
      cmd = { 'ncat', 'localhost', '6005' },
      filetypes = { 'gdscript' },
      skip_godot_check = true,
      debug_logging = true,
      dap = true,
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
        references = '<leader>cr',
        rename = '<leader>rn',
        workspace_symbols = '<leader>ws',
        format = '<leader>f',
        dap_continue = '<F5>',
        dap_toggle_breakpoint = '<F9>',
        dap_step_over = '<F10>',
        dap_step_into = '<F11>',
        dap_step_out = '<F12>',
        dap_ui = '<leader>du',
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePost', {
          buffer = bufnr,
          callback = function()
            local file = vim.fn.expand '%:p'
            local line = vim.fn.line '.'
            local col = vim.fn.col '.'
            vim.notify('Executing reload script for ' .. file)
            -- Use a login shell to inherit the user environment
            local cmd = 'PATH=$PATH:/usr/local/bin bash -l -c "/Users/MateoPanadero/.local/bin/open-nvim-godot.sh '
              .. file
              .. ' '
              .. line
              .. ' '
              .. col
              .. ' reload > /tmp/godot_lsp_log 2>&1"'
            local handle = io.popen(cmd)
            if handle then
              handle:close()
            end
            vim.notify 'Reload script executed, check /tmp/godot_lsp_log'
          end,
        })
      end,
    }
  end,
}
