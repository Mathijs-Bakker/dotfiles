-- local grapple = require 'grapple'

Nnoremap(',m', [[:lua require('grapple').tag()<CR>]])
Nnoremap(',e', [[:lua require('grapple').popup_tags()<CR>]])
Nnoremap('<Leader>,m', [[:lua require('grapple').untag()<CR>]])
Nnoremap(',a', [[:lua require('grapple').select({ key = 1 })<CR>]])
Nnoremap(',s', [[:lua require('grapple').select({ key = 2 })<CR>]])
Nnoremap(',d', [[:lua require('grapple').select({ key = 3 })<CR>]])
Nnoremap(',f', [[:lua require('grapple').select({ key = 4 })<CR>]])
