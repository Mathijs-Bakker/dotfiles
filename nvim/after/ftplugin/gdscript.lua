-- Avoid starting a duplicate LSP server, as godot-lsp.nvim handles it
local bufnr = vim.api.nvim_get_current_buf()
vim.bo[bufnr].filetype = 'gdscript' -- Ensure filetype is set
vim.treesitter.start(bufnr, 'gdscript') -- Ensure TreeSitter highlighting
-- Add any GDScript-specific mappings or settings here, e.g.:
vim.keymap.set('n', '<leader>r', '<cmd>!godot --headless --script %<CR>', { buffer = bufnr, desc = 'Run GDScript' })
