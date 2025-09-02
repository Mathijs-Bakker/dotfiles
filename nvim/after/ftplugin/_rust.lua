Nnoremap(
  'cr',
  [[:lua require('harpoon.term').sendCommand(1, 'cargo run\n')<CR> :lua require("harpoon.term").gotoTerminal(1)<CR>]]
)

vim.keymap.set('n', '<Leader>cb', ':! cargo build<CR>')
vim.keymap.set('n', '<Leader>ct', ':! cargo test<CR>')
vim.keymap.set('n', '<Leader>gd', ':Rust externalDocs<CR>')
vim.keymap.set('n', 'K', ':RustLsp hover actions<CR>')
vim.keymap.set('n', '<Leader>k', ':RustLsp moveItem up<CR>')
vim.keymap.set('n', '<leader>j', ':RustLsp moveItem down<CR>')
