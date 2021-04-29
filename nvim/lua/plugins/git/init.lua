-- Fugitive:

-- let g:fugitive_git_executable = 'hub'


Nvim_exec([[ let g:fugitive_git_executable = 'hub' ]], true)

Nnoremap('<Leader>gc', [[:Git commit -v<CR>]])
Nnoremap('<Leader>gs', [[:Git<CR>]])
Nnoremap('<Leader>ge', [[:Gedit<CR>]])
Nnoremap('<Leader>gr', [[:Gread<CR>]])
-- Nnoremap('<Leader>gb', [[:Gblame<CR>]])
Nnoremap('<Leader>gb', [[:Git blame<CR>]])
Nnoremap('<Leader>gp', [[:Git push<CR>]])

-- Fugitive-gitlab:

Nvim_exec([==[ let g:fugitive_gitlab_domains = ['https://my.gitlab.com']]==], true)

TrySource'plugins.git.gitlab_access_token'
