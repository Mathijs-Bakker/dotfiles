return {

  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  'neovim/nvim-lspconfig',

  -- DAP:
  'jayp0521/mason-nvim-dap.nvim',
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  { 'nvim-telescope/telescope-dap.nvim' },

  -- GODOT
  'habamax/vim-godot',
  'Cretezy/godot-server.nvim',

  -- Completion:
  'L3MON4D3/LuaSnip', -- Snippets
  {
    'doxnit/cmp-luasnip-choice',
    config = function()
      require('cmp_luasnip_choice').setup {
        auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
      }
    end,
  },
  'onsails/lspkind-nvim', --  vscode-like pictograms

  {
    'chrisgrieser/nvim-spider',
    lazy = true,
    dependencies = {
      'theHamsta/nvim_rocks',
    },
  },

  -- TELESCOPE
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require('telescope').load_extension 'frecency'
    end,
  },
  'nvim-telescope/telescope-ui-select.nvim',

  -- Appearance
  'nvim-tree/nvim-web-devicons',
  -- 'Mathijs-Bakker/gruvbox'
  -- 'ellisonleao/gruvbox.nvim',

  -- TPope
  'tpope/vim-commentary',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  -- 'tpope/vim-surround',

  -- Git:
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'ThePrimeagen/git-worktree.nvim',
  'tpope/vim-fugitive',
  'shumphrey/fugitive-gitlab.vim',
  'tpope/vim-rhubarb',
  'sodapopcan/vim-twiggy',
  'junegunn/gv.vim',
  'rhysd/git-messenger.vim',
  { 'ruifm/gitlinker.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  -- Indent
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  -- Folding:
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

  -- Which Key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      marks = false,
    },
  },

  {
    'j-hui/fidget.nvim',
    opts = {
      -- options
    },
  },
  {
    'slint-ui/vim-slint',
  },
  -- Rust:
  -- use 'simrat39/rust-tools.nvim'
  -- {
  -- 'mrcjkb/rustaceanvim',
  -- dependencies = 'j-hui/fidget.nvim',
  -- version = '^4', -- Recommended
  -- ft = { 'rust' },
  -- config = function()
  --   print 'Whhop rust'
  --   require('fidget').setup()
  -- end,
  -- },
  -- 'alx741/vim-rustfmt',
  -- Lua
  { 'folke/neodev.nvim', opts = {} },
  { 'ckipp01/stylua-nvim', build = 'cargo install stylua' },
}
