Opt.completeopt = { "menu", "menuone", "noselect" }
Opt.shortmess:append("c") -- don't give ins-compl-menu messages
O.pumblend = 0 -- Transparency pop up menu

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.diagnostic.config({
	virtual_text = false,
})

local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_buffer = require("cmp_buffer")
local icons = require("lspkind")

-- Setup nvim-cmp:
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- ['<Tab>'] = cmp.mapping(function(fallback)
		--   if cmp.visible() then
		--     cmp.select_next_item()
		--   elseif luasnip.expand_or_jumpable() then
		--     luasnip.expand_or_jump()
		--   elseif has_words_before() then
		--     cmp.complete()
		--   else
		--     fallback()
		--   end
		-- end, { 'i', 's' }),

		-- ['<S-Tab>'] = cmp.mapping(function(fallback)
		--   if cmp.visible() then
		--     cmp.select_prev_item()
		--   elseif luasnip.jumpable(-1) then
		--     luasnip.jump(-1)
		--   else
		--     fallback()
		--   end
		-- end, { 'i', 's' }),
	},
	-- The order of the sources list defines the priority of each source.
	sources = cmp.config.sources({
		{ name = "luasnip", priority = 100 },
		{ name = "nvim_lsp", priority = 50, max_item_count = 10 },
		{ name = "nvim_lua" },
		{ name = "custom_source" },
		{ name = "path" },
		{ name = "spell" },
		{ name = "zsh" },
		{
			name = "buffer",
			-- priority = 10,
			-- keyword_length = 2,
			max_item_count = 4,
			get_bufnrs = function()
				return vim.api.nvim_list_bufs()
			end,
		},
	}),
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
		format = icons.cmp_format({
			with_text = true,
			maxwidth = 50,
			menu = {
				custom_source = "[cust]",
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				luasnip = "[snip]",
				nvim_lua = "[api]",
				path = "[path]",
			},
		}),
	},
	-- view = {
	--   entries = 'native',
	-- },
	experimental = {
		ghost_text = true,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

vim.cmd([[
  imap <silent><expr> <C-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''
  inoremap <silent> <C-j> <cmd>lua require('luasnip').jump(-1)<CR>
  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
  snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(-1)<CR>
]])
