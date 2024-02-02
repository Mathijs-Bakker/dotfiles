--[[ Fugitive: ]]
vim.api.nvim_exec([[ let g:fugitive_git_executable = 'hub' ]], true)
-- Nvim_exec([[ let g:fugitive_git_executable = 'hub' ]], true)

Nnoremap('<Leader>ga', [[:Git add %:p<CR>]]) -- '$ git add' current file
Nnoremap('<Leader>gc', [[:Git commit -v<CR>]]) -- Git Commit
Nnoremap('<Leader>gs', [[:Git<CR>]]) -- Git Status
Nnoremap('<Leader>ge', [[:Gedit<CR>]]) -- Git Edit
Nnoremap('<Leader>gr', [[:Gread<CR>]])
Nnoremap('<Leader>gb', [[:Git blame<CR>]])
Nnoremap('<Leader>gp', [[:Git push<CR>]])

--[[ Fugitive-gitlab: ]]
-- vim.api.nvim_exec([==[ let g:fugitive_gitlab_domains = ['https://my.gitlab.com']]==], true)

-- require 'config.git.gitlab_access_token'

--[[ Git Messenger: ]]
Nnoremap('<leader>gm', [[<Plug>(git-messenger)]]) -- Default mapping

--[[ GV: ]]
-- A 'git log --graph' wrapper

Nnoremap('<Leader>gl', [[:GV<CR>]])
