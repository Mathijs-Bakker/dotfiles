local function keybinder(mode, keys, cmd)
	local mode = mode
	local keys = keys
	local cmd = cmd
	vim.api.nvim_set_keymap(mode, keys, cmd, { noremap = true, silent = true })
end

function nnoremap(keys, cmd)
 	keybinder('n', keys, cmd)
end

function inoremap(keys, cmd)
 	keybinder('i', keys, cmd)
end

function vnoremap(keys, cmd)
 	keybinder('v', keys, cmd)
end

function tnoremap(keys, cmd)
 	keybinder('t', keys, cmd)
end

function inoremap_expr(keys, cmd)
	vim.api.nvim_set_keymap('i', keys, cmd, { expr = true, noremap = true, silent = true })
end

function snoremap_expr(keys, cmd)
	vim.api.nvim_set_keymap('s', keys, cmd, { expr = true, noremap = true, silent = true })
end

