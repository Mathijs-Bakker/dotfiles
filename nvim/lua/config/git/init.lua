-- Fugitive:
vim.api.nvim_exec([[ let g:fugitive_git_executable = 'hub' ]], true)
-- Git Worktree:
require('telescope').load_extension 'git_worktree'

local wk = require 'which-key'
wk.add {
  { '<leader>g', group = 'git' }, -- group
  -- { "<leader>g",  , desc = "", mode = "n" },
  { '<leader>ga', [[:Git add %:p<CR>]], desc = 'Git Add (current buffer)', mode = 'n' },
  { '<leader>gb', [[:Git blame<CR>]], desc = 'Git Blame', mode = 'n' },
  { '<leader>gc', [[:Git commit -v<CR>]], desc = 'Git Commit', mode = 'n' },
  { '<leader>ge', [[:Gedit<CR>]], desc = 'Git Edit', mode = 'n' },
  { '<leader>gf', [[:Git pull --rebase<CR>]], desc = "Git ('Fetch') pull --rebase", mode = 'n' },
  { '<leader>gl', [[:GV<CR>]], desc = 'Git Log', mode = 'n' },
  { '<leader>gp', [[:Git push<CR>]], desc = 'Git Push', mode = 'n' },
  { '<leader>gr', [[:Gread<CR>]], desc = 'Git Read', mode = 'n' },
  { '<leader>gs', [[:Git<CR>]], desc = 'Git Status', mode = 'n' },
  { '<leader>gm', [[<Plug>(git-messenger)]], desc = 'Git Blame under cursor', mode = 'n' },
  { '<leader>gd', [[:Gvdiffsplit!<CR>]], desc = '3-window Diffsplit', mode = 'n' },
  {
    '<leader>gh',
    [[<cmd>diffget //2<CR>]],
    desc = 'Diffget From Left Window)',
    mode = 'n',
  },
  { '<leader>gl', [[<cmd>diffget //3<CR> ]], desc = 'Diffget From Right Window', mode = 'n' },
  { '<leader>gw', group = 'git worktree' }, -- group
  {
    '<leader>gwl',
    [[:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]],
    desc = 'Worktree List',
    mode = 'n',
  },
  {
    '<leader>gwc',
    [[:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]],
    desc = 'Worktree Create',
    mode = 'n',
  },
}
