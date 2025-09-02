return {
  dir = '~/Repositories/godotdev.nvim', -- local dev path
  name = 'godotdev.nvim',
  dev = true, -- marks as local dev plugin
  lazy = false, -- load on startup
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    require('godotdev').setup {
      editor_port = 6005, -- override default 6005
      editor_host = '127.0.0.1', -- override default '127.0.0.1'
      debug_port = 6006, -- override default 6006
      csharp = true,
    }
  end,
}
