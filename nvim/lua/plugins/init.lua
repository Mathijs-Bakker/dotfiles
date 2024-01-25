return {

	-- Treesitter:
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate all' },
  'nvim-treesitter/playground',
  -- use 'tjdevries/tree-sitter-lua'

  -- LSP:
  'neovim/nvim-lspconfig',
  'nvim-lua/lsp-status.nvim',

  -- DAP:
	'mfussenegger/nvim-dap',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
    'jayp0521/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap',
'rcarriga/nvim-dap-ui',
  { 'nvim-telescope/telescope-dap.nvim' },

-- Completion:
  'hrsh7th/nvim-cmp', -- Cmp
  'L3MON4D3/LuaSnip',-- Snippets
  {
    'doxnit/cmp-luasnip-choice',
    config = function()
      require('cmp_luasnip_choice').setup {
        auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
      }
    end,
  },
  'onsails/lspkind-nvim', --  vscode-like pictograms
  -- Nvim-Cmp sources:
  'f3fora/cmp-spell', -- src for vim's spellsuggest
  'hrsh7th/cmp-buffer', -- src for buffer words
  'hrsh7th/cmp-cmdline', -- src for vim's cmdline
  'hrsh7th/cmp-nvim-lua', -- src for nvim lua
  'hrsh7th/cmp-nvim-lsp', -- src for neovim builtin LSP client
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'hrsh7th/cmp-path', -- src for path
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'saadparwaiz1/cmp_luasnip', -- src for luasnip
  'tamago324/cmp-zsh',

-- TELESCOPE
{
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
},
{
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").load_extension "frecency"
  end,
},
	'nvim-telescope/telescope-ui-select.nvim',

-- -- Harrrrpooon
-- { 
-- 	'ThePrimeagen/harpoon',
-- 	branch = 'harpoon2'
-- },

-- File Explorer
-- 'tamago324/lir.nvim',
'tamago324/lir-bookmark.nvim',
'tamago324/lir-git-status.nvim',

-- Appearance
'nvim-tree/nvim-web-devicons',
-- 'Mathijs-Bakker/gruvbox'
'ellisonleao/gruvbox.nvim',

-- TPope
'tpope/vim-commentary',
'tpope/vim-unimpaired',
'tpope/vim-repeat', 
'tpope/vim-surround',

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
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {} 
},
-- Folding:
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

-- -- Startup (Dashboard)
-- {
--     'goolord/alpha-nvim',
--     dependencies = { 'kyazdani42/nvim-web-devicons' },
-- },

-- Which Key
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    marks = false,
  }
},

-- Rust:
  -- use 'simrat39/rust-tools.nvim'
  'mrcjkb/rustaceanvim',
  'alx741/vim-rustfmt',

-- Lua
{ "folke/neodev.nvim", opts = {} },
{ "ckipp01/stylua-nvim", build = "cargo install stylua"},

} 

