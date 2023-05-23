return require('packer').startup(function()
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- use { '~/Repositories/plenary.nvim', branch = 'bustin-makes-you-feel-good' }
  use { '~/Repositories/refactoring.nvim' }

  -- Treesitter:
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate all' }
  use 'nvim-treesitter/playground'
  -- use 'tjdevries/tree-sitter-lua'

  -- LSP:
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  -- use 'nvimdev/lspsaga.nvim'

  -- DAP:
  use 'mfussenegger/nvim-dap'
  use { 'williamboman/mason.nvim', require('mason').setup() }
  use { 'williamboman/mason-lspconfig.nvim', require('mason').setup() }
  use {
    'jayp0521/mason-nvim-dap.nvim',
    require('mason-nvim-dap').setup { ensure_installed = { 'lldb' } },
    automatic_setup = true,
  }
  use { 'nvim-telescope/telescope-dap.nvim' }

  -- -- Completion:
  use 'hrsh7th/nvim-cmp' -- Cmp
  use 'L3MON4D3/LuaSnip' -- Snippets
  use {
    'doxnit/cmp-luasnip-choice',
    config = function()
      require('cmp_luasnip_choice').setup {
        auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
      }
    end,
  }
  use 'onsails/lspkind-nvim' --  vscode-like pictograms
  -- -- Nvim-Cmp sources:
  use 'f3fora/cmp-spell' -- src for vim's spellsuggest
  use 'hrsh7th/cmp-buffer' -- src for buffer words
  use 'hrsh7th/cmp-cmdline' -- src for vim's cmdline
  use 'hrsh7th/cmp-nvim-lua' -- src for nvim lua
  use 'hrsh7th/cmp-nvim-lsp' -- src for neovim builtin LSP client
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-path' -- src for path
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'saadparwaiz1/cmp_luasnip' -- src for luasnip
  use 'tamago324/cmp-zsh'

  -- Folding:
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- use 'rafamadriz/friendly-snippets'

  -- Clipboard Manager:
  -- TODO: Read the docs
  use {
    'AckslD/nvim-neoclip.lua',
    config = function()
      require('neoclip').setup()
    end,
  }

  -- Git:
  -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'ThePrimeagen/git-worktree.nvim'
  use 'tpope/vim-fugitive'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-rhubarb'
  use 'sodapopcan/vim-twiggy'
  use 'junegunn/gv.vim'
  use 'rhysd/git-messenger.vim'
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      -- {'yamatsum/nvim-nonicons'},
      { 'nvim-telescope/telescope-fzf-writer.nvim' },
    },
  }

  use 'nvim-telescope/telescope-ui-select.nvim'

  use {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require('telescope').load_extension 'frecency'
    end,
    requires = { 'tami5/sqlite.lua' },
  }

  use 'nvim-telescope/telescope-project.nvim'

  -- File Explorer
  -- use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
  use { 'tamago324/lir.nvim' }
  use { 'tamago324/lir-bookmark.nvim' }
  use { 'tamago324/lir-git-status.nvim' }

  -- Reload
  use { 'famiu/nvim-reload', requires = { 'nvim-lua/plenary.nvim' } }

  -- Which Key?
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
        plugins = {
          marks = false,
        },
      }
    end,
  }

  use 'mrk21/yaml-vim'

  -- Appearance
  -- use 'kyazdani42/nvim-web-devicons'
  use 'nvim-tree/nvim-web-devicons'
  -- use 'Mathijs-Bakker/gruvbox'
  -- use 'lifepillar/vim-gruvbox8'
  use 'ellisonleao/gruvbox.nvim'
  -- use 'rebelot/kanagawa.nvim'

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }

  -- Writing
  use 'junegunn/goyo.vim'

  -- Misc:
  -- use 'mhinz/vim-startify'
  -- use 'glepnir/dashboard-nvim'
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  --   use {
  --     'akinsho/toggleterm.nvim',
  --     config = function()
  --       require('toggleterm').setup {
  --         open_mapping = ',j',
  --         direction = 'float',
  --       }
  --     end,
  --   }

  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'ggandor/leap.nvim'
  use 'sickill/vim-pasta'
  -- use 'airblade/vim-rooter'
  -- use 'oberblastmeister/rooter.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'euclidianAce/BetterLua.vim'
  use {
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup {
        global_settings = {
          mark_branch = true,
        },
      }
    end,
  }
  -- use {
  --   'cbochs/grapple.nvim',
  --   requires = { 'nvim-lua/plenary.nvim' },
  -- }
  use 'tjdevries/nlua.nvim'
  use 'Mathijs-Bakker/zoom-vim'
  -- use 'dstein64/vim-startuptime'
  use 'tpope/vim-surround'
  -- Language specific:
  -- use 'folke/lua-dev.nvim'
  use 'ckipp01/stylua-nvim'

  -- Rust:
  use 'simrat39/rust-tools.nvim'
  use 'alx741/vim-rustfmt'
end)
