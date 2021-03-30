local g = vim.g

g.startify_files_number = 10
-- Don't change to directory when selecting a file
g.startify_change_to_dir = 0
g.startify_custom_header = { }
g.startify_relative_path = 1
g.startify_use_env = 1

vim.cmd([[
function! List_commits()
   let git = 'git -C ' . getcwd()
   let commits = systemlist(git . ' log --oneline | head -n5')
   let git = 'G' . git[1:]

   return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction
]])

vim.api.nvim_exec([===[
let g:startify_lists = [ { 'type': 'dir', 'header': [ 'Files '. getcwd() ] }, { 'type': function('List_commits'), 'header': [ 'Recent Commits' ] }, { 'type': 'sessions',  'header': [ 'Sessions' ]       }, { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      }, { 'type': 'commands',  'header': [ 'Commands' ]       }, ]
]===], true)

vim.api.nvim_exec([===[
let g:startify_commands = [{ 'up': [ 'Update/Sync Plugins', ':PackerSync' ] }, { 'ch': [ ':checkhealth', ':checkhealth' ] }]
]===],
true)

vim.api.nvim_exec([===[
let g:startify_bookmarks = [ { 'p': '~/.dotfiles/nvim/lua/packer/plugins.lua' }, { 'o': '~/.dotfiles/nvim/lua/config/options.lua' }, { 'm': '~/.dotfiles/nvim/lua/config/keymaps.lua' }, { 'in': '~/.dotfiles/nvim/init.lua' }, { 'z': '~/.zshrc' } ]
]===],
true)

vim.cmd('autocmd User Startified setlocal cursorline')
Nnoremap('<leader>st', ':Startify<cr>')
