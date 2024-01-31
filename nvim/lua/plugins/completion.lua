return {
  'hrsh7th/nvim-cmp', -- Cmp
  event = 'InsertEnter',
  dependencies = {
    'f3fora/cmp-spell', -- src for vim's spellsuggest
    'hrsh7th/cmp-buffer', -- src for buffer words
    'hrsh7th/cmp-cmdline', -- src for vim's cmdline
    'hrsh7th/cmp-nvim-lsp', -- src for neovim builtin LSP client
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua', -- src for nvim lua
    'hrsh7th/cmp-path', -- src for path
    'saadparwaiz1/cmp_luasnip', -- src for luasnip
    'tamago324/cmp-zsh',
  },
  opts = function()
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
    local cmp = require 'cmp'
    local defaults = require 'cmp.config.default'()
    return {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = 'menu, menuone, noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<S-CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-CR>'] = function(fallback)
          cmp.abort()
          fallback()
        end,
      },
      -- The order of the sources list defines the priority of each source.
      sources = cmp.config.sources {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'custom_source' },
        { name = 'path' },
        { name = 'spell' },
        { name = 'zsh' },
        {
          name = 'buffer',
          keyword_length = 3,
          max_item_count = 3,
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },

        experimental = {
          ghost_text = {
            hl_group = 'CmpGhostText',
          },
        },
        sorting = {
          priority_weight = 10,
          comparators = {
            -- Buffer(s): Return result nearest to the cursor, then from other buffers.
            -- function(...)
            --   return cmp_buffer:compare_locality(...)
            -- end,

            -- Default comperators:
            -- cmp.config.compare.offset,
            -- cmp.config.compare.exact,
            -- cmp.config.compare.score,
            -- cmp.config.compare.recently_used,
            -- cmp.config.compare.kind,
            -- cmp.config.compare.sort_text,
            -- cmp.config.compare.length,
            -- cmp.config.compare.order,
          },
        },
        formatting = {
          format = icons.cmp_format {
            with_text = true,
            maxwidth = 50,
            menu = {
              custom_source = '[cust]',
              buffer = '[buf]',
              nvim_lsp = '[lsp]',
              luasnip = '[snip]',
              nvim_lua = '[api]',
              path = '[path]',
            },
          },
        },
        -- view = {
        --   entries = 'native',
        -- },
        experimental = {
          ghost_text = true,
        },
      },
    }
  end,
}
---- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--  sources = cmp.config.sources({
--    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--  }, {
--    { name = 'buffer' },
--  })
--})

---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline({ '/', '?' }, {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
--})

---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  })
--})

---- Set up lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
--}

-----@param opts cmp.ConfigSchema
--config = function(_, opts)
--  for _, source in ipairs(opts.sources) do
--    source.group_index = source.group_index or 1
--  end
--  require('cmp').setup(opts)
--end,
