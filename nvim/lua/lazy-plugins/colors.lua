return {
  'sainnhe/gruvbox-material',
  config = function()
    vim.opt.termguicolors = true
    vim.o.background = 'dark' -- or "light" for light mode
    vim.cmd [[colorscheme gruvbox-material]]
  end,
}

-- return {
-- -- 'Mathijs-Bakker/gruvbox'
-- 'ellisonleao/gruvbox.nvim',

--   config = function()
--     vim.opt.termguicolors = true
--     vim.o.background = 'dark' -- or "light" for light mode
--     vim.cmd [[colorscheme gruvbox]]
--   end,
-- }
