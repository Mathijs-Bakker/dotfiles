vim.o.completeopt = "menuone,noinsert,noselect"

-- Don't show the dumb matching stuff.
-- vim.cmd [[set shortmess+=c]]

-- completion.nvim
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_enable_snippet = 'snippets.nvim'

-- Decide on length
vim.g.completion_trigger_keyword_length = 2

local has_compe, compe = pcall(require, 'compe')
if has_compe then
  compe.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;

    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = false;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
    };
  }
end


Inoremap_expr('<C-Space>', 'compe#complete()')
Inoremap_expr('<CR>', "compe#confirm('<CR>')")
Inoremap_expr('<C-e>', "compe#close('<C-e>')")
Inoremap_expr('<C-f>', "compe#scroll({ 'delta': +4 })")
Inoremap_expr('<C-d>', "compe#scroll({ 'delta': -4 })")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

Inoremap_expr("<Tab>", "v:lua.tab_complete()")
Snoremap_expr("<Tab>", "v:lua.tab_complete()")
Inoremap_expr("<S-Tab>", "v:lua.s_tab_complete()")
Snoremap_expr("<S-Tab>", "v:lua.s_tab_complete()")
