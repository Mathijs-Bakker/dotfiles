Nnoremap ('<Leader>a', [[:lua require('harpoon.mark').add_file()<CR>]])
Nnoremap ('<C-e>', [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]])

-- m = mark
Nnoremap ('ma', [[:lua require('harpoon.ui').nav_file(1)<CR>]])
Nnoremap ('ms', [[:lua require('harpoon.ui').nav_file(2)<CR>]])
Nnoremap ('md', [[:lua require('harpoon.ui').nav_file(3)<CR>]])
Nnoremap ('mf', [[:lua require('harpoon.ui').nav_file(4)<CR>]])

-- t = terminal
Nnoremap ('ta', [[:lua require('harpoon.term').gotoTerminal(1)<CR>]])
Nnoremap ('ts', [[:lua require('harpoon.term').gotoTerminal(2)<CR>]])
Nnoremap ('td', [[:lua require('harpoon.term').sendCommand(1, 1)<CR>]])
Nnoremap ('tf', [[:lua require('harpoon.term').sendCommand(1, 'la')<CR>]])
