return {
  'hrsh7th/nvim-cmp', -- Cmp
  dependencies = { -- Nvim-Cmp sources:
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
  },
  config = function()
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    vim.opt.shortmess:append 'c' -- don't give ins-compl-menu messages
    vim.o.pumblend = 0 -- transparency pop up menu

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end

    local cmp = require 'cmp'
    local icons = require 'lspkind'

    -- setup nvim-cmp:
    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<c-j>'] = cmp.mapping.select_next_item(),
        ['<c-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<c-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<c-y>'] = cmp.config.disable, -- specify `cmp.config.disable` if you want to remove the default `<c-y>` mapping.
        -- ['<c-e>'] = cmp.mapping {
        ['<c-l>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ['<cr>'] = cmp.mapping.confirm { select = true },
      },
      -- the order of the sources list defines the priority of each source.
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
      },

      sorting = {
        priority_weight = 10,
        comparators = {
          -- buffer(s): return result nearest to the cursor, then from other buffers.
          -- function(...)
          --   return cmp_buffer:compare_locality(...)
          -- end,

          -- default comperators:
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
    }

    -- use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })

    vim.cmd [[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : ''
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<cr>
  imap <silent><expr> <c-l> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<C-l>'
  snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]
  end,
}
