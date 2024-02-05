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

-- Resolving a 3-way diff with :diffget
Nnoremap('gj', [[<cmd>diffget //2CR ]]) -- fetches the hunk from the target parent (on the left)
Nnoremap('gk', [[<cmd>diffget //3CR ]]) -- fetches the hunk from the merge parent (on the right)
