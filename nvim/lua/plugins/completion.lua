-- O.completeopt = "menuone,noinsert,noselect"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require'luasnip'
local cmp = require'cmp'

-- Setup nvim-cmp:
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
 -- vim.cmd [[
 --  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
 --  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
 --  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
 --  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
 --  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
-- ]]
['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_next_item()
	  elseif luasnip.expand_or_jumpable() then
	    luasnip.expand_or_jump()
	  elseif has_words_before() then
	    cmp.complete()
	  else
	    fallback()
	  end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_prev_item()
	  elseif luasnip.jumpable(-1) then
	    luasnip.jump(-1)
	  else
	    fallback()
	  end
	end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'spell' },
    { name = 'zsh' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  },{
    { name = 'buffer' }
  })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }
-- -- Don't show the dumb matching stuff.
-- -- vim.cmd [[set shortmess+=c]]

-- -- completion.nvim
-- G.completion_confirm_key = ""
-- G.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- G.completion_enable_snippet = 'snippets.nvim'

-- -- Decide on length
-- G.completion_trigger_keyword_length = 2

-- local has_compe, compe = pcall(require, 'compe')
-- if has_compe then
--   compe.setup {
--     enabled = true;
--     autocomplete = true;
--     debug = false;
--     min_length = 1;
--     preselect = 'enable';
--     throttle_time = 80;
--     source_timeout = 200;
--     incomplete_delay = 400;
--     allow_prefix_unmatch = false;

--     source = {
--       path = true;
--       buffer = true;
--       calc = true;
--       vsnip = false;
--       nvim_lsp = true;
--       nvim_lua = true;
--       spell = true;
--       tags = true;
--       snippets_nvim = true;
--     };
--   }
-- end


-- Inoremap_expr('<C-Space>', 'compe#complete()')
-- Inoremap_expr('<CR>', "compe#confirm('<CR>')")
-- Inoremap_expr('<C-e>', "compe#close('<C-e>')")
-- Inoremap_expr('<C-f>', "compe#scroll({ 'delta': +4 })")
-- Inoremap_expr('<C-d>', "compe#scroll({ 'delta': -4 })")

-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- local check_back_space = function()
--     local col = vim.fn.col('.') - 1
--     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return true
--     else
--         return false
--     end
-- end

-- -- Use (s-)tab to:
-- --- move to prev/next item in completion menuone
-- --- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-n>"
--   elseif vim.fn.call("vsnip#available", {1}) == 1 then
--     return t "<Plug>(vsnip-expand-or-jump)"
--   elseif check_back_space() then
--     return t "<Tab>"
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
--     return t "<Plug>(vsnip-jump-prev)"
--   else
--     return t "<S-Tab>"
--   end
-- end

-- Inoremap_expr("<Tab>", "v:lua.tab_complete()")
-- Snoremap_expr("<Tab>", "v:lua.tab_complete()")
-- Inoremap_expr("<S-Tab>", "v:lua.s_tab_complete()")
-- Snoremap_expr("<S-Tab>", "v:lua.s_tab_complete()")
