" Don't change to directory when selecting a file
let g:startify_files_number = 10
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

function! s:list_commits()
   let git = 'git -C ' . getcwd()
   let commits = systemlist(git . ' log --oneline | head -n5')
   let git = 'G' . git[1:]

   return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
\  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
\  { 'type': 'commands',  'header': [ 'Commands' ]       },
\ ]

let g:startify_commands = [
\   { 'up': [ 'Update/Sync Plugins', ':PackerSync' ] },
\   { 'ch': [ ':checkhealth', ':checkhealth' ] }
\ ]

let g:startify_bookmarks = [
\ { 'p': '~/.dotfiles/nvim/lua/packer/plugins.lua' },
\ { 'o': '~/.dotfiles/nvim/lua/config/options.lua' },
\ { 'm': '~/.dotfiles/nvim/lua/config/keymaps.lua' },
\ { 'in': '~/.dotfiles/nvim/init.lua' },
\ { 'z': '~/.zshrc' }
\ ]

autocmd User Startified setlocal cursorline
nmap <leader>st :Startify<cr>
