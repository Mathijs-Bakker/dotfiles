return {
  'L3MON4D3/LuaSnip',
  version = vim.version.range '2',
  build = 'make install_jsregexp',
  config = function()
    require 'config.luasnip'
  end,
}
