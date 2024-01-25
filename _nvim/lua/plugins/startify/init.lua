G.startify_files_number = 10
-- Don't change to directory when selecting a file
G.startify_change_to_dir = 0
G.startify_custom_header = { }
G.startify_relative_path = 1
G.startify_use_env = 1

-- Icons:
function _G.webDevIcons(path)
  local filename = vim.fn.fnamemodify(path, ':t')
  local extension = vim.fn.fnamemodify(path, ':e')
  return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end

Cmd([[
function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction
]])

--

Cmd([[
function! List_commits()
   let git = 'git -C ' . getcwd()
   let commits = systemlist(git . ' log --oneline | head -n5')
   let git = 'G' . git[1:]

   return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction
]])

Nvim_exec([===[
let g:startify_lists = [ { 'type': 'dir', 'header': [ 'Files '. getcwd() ] }, { 'type': function('List_commits'), 'header': [ 'Recent Commits' ] }, { 'type': 'sessions',  'header': [ 'Sessions' ]       }, { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      }, { 'type': 'commands',  'header': [ 'Commands' ]       }, ]
]===], true)

Nvim_exec([===[
let g:startify_commands = [{ 'up': [ 'Update/Sync Plugins', ':PackerSync' ] }, { 'ch': [ ':checkhealth', ':checkhealth' ] }]
]===],
true)

Nvim_exec([===[
let g:startify_bookmarks = [ { 'p': '~/.dotfiles/nvim/lua/packer/plugins.lua' }, { 'o': '~/.dotfiles/nvim/lua/config/options.lua' }, { 'm': '~/.dotfiles/nvim/lua/config/keymaps.lua' }, { 'in': '~/.dotfiles/nvim/init.lua' }, { 'z': '~/.zshrc' } ]
]===],
true)

Cmd('autocmd User Startified setlocal cursorline')
Nnoremap('<leader>st', ':Startify<cr>')
