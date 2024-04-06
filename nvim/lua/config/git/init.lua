--[[ Fugitive: ]]
vim.api.nvim_exec([[ let g:fugitive_git_executable = 'hub' ]], true)
-- Nvim_exec([[ let g:fugitive_git_executable = 'hub' ]], true)

Nnoremap('<Leader>ga', [[:Git add %:p<CR>]]) -- '$ git add' current file
Nnoremap('<Leader>gb', [[:Git blame<CR>]]) -- Gitt Blame
Nnoremap('<Leader>gc', [[:Git commit -v<CR>]]) -- Git Commit
Nnoremap('<Leader>ge', [[:Gedit<CR>]]) -- Git Edit
Nnoremap('<Leader>gf', [[:Git pull --rebase<CR>]]) -- Git Pull/Fetch
Nnoremap('<Leader>gl', [[:GV<CR>]]) -- Git Log
Nnoremap('<Leader>gp', [[:Git push<CR>]]) -- Git Push
Nnoremap('<Leader>gr', [[:Gread<CR>]])
Nnoremap('<Leader>gs', [[:Git<CR>]]) -- Git Status

--[[ Fugitive-gitlab: ]]
-- vim.api.nvim_exec([==[ let g:fugitive_gitlab_domains = ['https://my.gitlab.com']]==], true)

-- require 'config.git.gitlab_access_token'

--[[ Git Messenger: ]]
Nnoremap('<leader>gm', [[<Plug>(git-messenger)]]) -- Git Blame under cursor

--[[ GV: ]]
-- A 'git log --graph' wrapper

Nnoremap('<Leader>gd', [[:Gvdiffsplit!<CR>]]) -- 3 window diff split
-- Resolving a 3-way diff with :diffget
Nnoremap('gh', [[<cmd>diffget //2<CR>]]) -- fetches the hunk from the target parent (on the left)
Nnoremap('gl', [[<cmd>diffget //3<CR> ]]) -- fetches the hunk from the merge parent (on the right)

-- ---------------------------
-- Git-Worktree
-- ---------------------------
require('telescope').load_extension 'git_worktree'

-- Worktree List:
Nnoremap('<Leader>gwl', [[:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]])
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-D> - force deletes that worktree

-- Worktree Creation:
Nnoremap('<Leader>gwc', [[:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]])
