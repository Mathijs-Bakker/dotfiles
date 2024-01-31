return {
  'ggandor/leap.nvim',
  dependencies = 'tpope/vim-repeat',
  config = function()
    require('leap').create_default_mappings()
  end,
}
