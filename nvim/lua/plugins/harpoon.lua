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

return {
  'ThePrimeagen/harpoon',
  -- branch = 'harpoon2',
  dependencies = { "nvim-lua/plenary.nvim" }, 
  enabled = true,

  config = {
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal 
    -- when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { 'harpoon' },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
  },
  },
}
