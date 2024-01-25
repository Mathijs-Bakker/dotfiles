require("telescope").load_extension("git_worktree")

-- Worktree List:
Nnoremap ('<Leader>gwl', [[:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]])
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-D> - force deletes that worktree

-- Worktree Creation:
Nnoremap ('<Leader>gwc', [[:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]])
