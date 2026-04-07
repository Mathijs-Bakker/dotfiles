return {
  dir = '~/Repositories/godotdev.nvim', -- local dev path
  name = 'godotdev.nvim',
  dev = true, -- marks as local dev plugin
  dependencies = {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local netcoredbg = vim.fn.exepath 'netcoredbg'
    if netcoredbg == '' then
      local fallback = vim.fn.expand '~/.local/bin/netcoredbg'
      if vim.fn.executable(fallback) == 1 then
        netcoredbg = fallback
      end
    end

    require('godotdev').setup {
      editor_port = 6005, -- override default 6005
      editor_host = '127.0.0.1', -- override default '127.0.0.1'
      debug_port = 6006, -- override default 6006
      csharp = netcoredbg ~= '',
      netcoredbg_path = netcoredbg ~= '' and netcoredbg or nil,
      -- formatter = 'gdscript-format',
      formatter = 'gdformat',
    }
  end,
  keys = {
    { 'gK', '<cmd>GodotDocsBuffer<cr>', desc = 'Godot Class Documentation' },
  },
}
