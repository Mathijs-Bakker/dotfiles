Nnoremap(',m', [[:lua require('harpoon.mark').add_file()<CR>]])
Nnoremap(',e', [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]])

Nnoremap(',a', [[:lua require('harpoon.ui').nav_file(1)<CR>]])
Nnoremap(',s', [[:lua require('harpoon.ui').nav_file(2)<CR>]])
Nnoremap(',d', [[:lua require('harpoon.ui').nav_file(3)<CR>]])
Nnoremap(',f', [[:lua require('harpoon.ui').nav_file(4)<CR>]])
Nnoremap(',g', [[:lua require('harpoon.ui').nav_file(5)<CR>]])

-- t = terminal
Nnoremap(',c', [[:lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>]])
Nnoremap(',j', [[:lua require('harpoon.term').gotoTerminal(1)<CR>]])
Nnoremap(',k', [[:lua require('harpoon.term').gotoTerminal(2)<CR>]])
Nnoremap(',l', [[:lua require('harpoon.term').gotoTerminal(3)<CR>]])
Nnoremap(',1', [[:lua require('harpoon.term').sendCommand(1, 1)<CR>]])
Nnoremap(',2', [[:lua require('harpoon.term').sendCommand(1, 2)<CR>]])
Nnoremap(',3', [[:lua require('harpoon.term').sendCommand(1, 3)<CR>]])
Nnoremap(',4', [[:lua require('harpoon.term').sendCommand(1, 4)<CR>]])
-- Nnoremap('cr', [[:lua require('harpoon.term').sendCommand(1, 'cr')<CR>]])
-- tf :lua require('harpoon.term').sendCommand(1, 'la')<CR>  tf :lua require('harpoon.term').sendCommand(1, 'la')<CR>

-- require('harpoon').setup {
-- mark_branch = true,
-- }
