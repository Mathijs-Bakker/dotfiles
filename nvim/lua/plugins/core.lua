return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  'onsails/lspkind-nvim',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-commentary',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  'sindrets/diffview.nvim',
  'ThePrimeagen/git-worktree.nvim',
  'tpope/vim-fugitive',
  'shumphrey/fugitive-gitlab.vim',
  'tpope/vim-rhubarb',
  'sodapopcan/vim-twiggy',
  'junegunn/gv.vim',
  'rhysd/git-messenger.vim',
  'slint-ui/vim-slint',

  { 'ruifm/gitlinker.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  { 'doxnit/cmp-luasnip-choice', config = function()
    require('cmp_luasnip_choice').setup { auto_open = true }
  end },
  {
    'folke/which-key.nvim',
    init = function()
      vim.o.timeoutlen = 500
    end,
    opts = {
      marks = false,
    },
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    'ckipp01/stylua-nvim',
    build = 'cargo install stylua',
  },
}
