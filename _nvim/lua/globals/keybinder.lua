local function keybinder(mode, keys, cmd)
	local mode = mode
	local keys = keys
	local cmd = cmd
	vim.api.nvim_set_keymap(mode, keys, cmd, { noremap = true, silent = true })
end

function Nnoremap(keys, cmd)
 	keybinder('n', keys, cmd)
end

function Inoremap(keys, cmd)
 	keybinder('i', keys, cmd)
end

function Vnoremap(keys, cmd)
 	keybinder('v', keys, cmd)
end

function Tnoremap(keys, cmd)
 	keybinder('t', keys, cmd)
end

function Inoremap_expr(keys, cmd)
	vim.api.nvim_set_keymap('i', keys, cmd, { expr = true, noremap = true, silent = true })
end

function Snoremap_expr(keys, cmd)
	vim.api.nvim_set_keymap('s', keys, cmd, { expr = true, noremap = true, silent = true })
end

