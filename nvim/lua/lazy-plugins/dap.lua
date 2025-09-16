return {
  -- DAP:
  'jayp0521/mason-nvim-dap.nvim',
  'mfussenegger/nvim-dap',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dapui = require 'dapui'
      dapui.setup()
    end,
  },
  { 'nvim-telescope/telescope-dap.nvim' },

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc })
    end

    -- Basic debugger controls
    map('n', '<F5>', dap.continue, 'DAP: Continue/Start')
    map('n', '<F10>', dap.step_over, 'DAP: Step over')
    map('n', '<F11>', dap.step_into, 'DAP: Step into')
    map('n', '<F12>', dap.step_out, 'DAP: Step out')
    map('n', '<leader>db', dap.toggle_breakpoint, 'DAP: Toggle breakpoint')
    map('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, 'DAP: Conditional breakpoint')

    -- UI
    map('n', '<leader>du', dapui.toggle, 'DAP: Toggle UI')
    map('n', '<leader>dr', dap.repl.open, 'DAP: Open REPL')
  end,
}
