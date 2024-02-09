return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  lazy = false,
  ft = { 'rust' },
  dependencies = {
    'j-hui/fidget.nvim', -- Doesn't work with mason-lspconfig
  },

  config = function()
    require('fidget').setup()
  end,
}
