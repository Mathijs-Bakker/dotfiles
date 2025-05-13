return {
  'ThePrimeagen/harpoon',
  -- branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  enabled = true,
  keys = {
    -- Engram/Enthium:
    { ';e', [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]], { silent = true }, desc = 'Harpoon Menu' },
    { ';m', [[:lua require('harpoon.mark').add_file()<CR>]], { silent = true }, desc = 'Harpoon Mark' },

    -- { '<Space>c', [[:lua require('harpoon.ui').nav_file(1)<CR>]], { silent = true }, desc = 'Harpoon M1' },
    -- { '<Space>i', [[:lua require('harpoon.ui').nav_file(2)<CR>]], { silent = true }, desc = 'Harpoon M2' },
    -- { '<Space>e', [[:lua require('harpoon.ui').nav_file(3)<CR>]], { silent = true }, desc = 'Harpoon M3' },
    -- { '<Space>a', [[:lua require('harpoon.ui').nav_file(4)<CR>]], { silenw = true }, desc = 'Harpoon M4' },
    -- { '<Space>,', [[:lua require('harpoon.ui').nav_file(5)<CR>]], { silent = true }, desc = 'Harpoon M5' },
    { ';h', [[:lua require('harpoon.ui').nav_file(1)<CR>]], { silent = true }, desc = 'Harpoon M1' },
    { ';t', [[:lua require('harpoon.ui').nav_file(2)<CR>]], { silent = true }, desc = 'Harpoon M2' },
    { ';n', [[:lua require('harpoon.ui').nav_file(3)<CR>]], { silent = true }, desc = 'Harpoon M3' },
    { ';s', [[:lua require('harpoon.ui').nav_file(4)<CR>]], { silent = true }, desc = 'Harpoon M4' },
    { ';z', [[:lua require('harpoon.ui').nav_file(5)<CR>]], { silent = true }, desc = 'Harpoon M5' },
    {
      ',c',
      [[:lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>]],
      { silent = true },
      desc = 'Harpoon Commands Menu',
    },
    -- { ',h', [[:lua require('harpoon.term').gotoTerminal(1)<CR>]], { silent = true }, desc = 'Harpoon Term 1' },
    -- { ',t', [[:lua require('harpoon.term').gotoTerminal(2)<CR>]], { silent = true }, desc = 'Harpoon Term 2' },
    -- { ',s', [[:lua require('harpoon.term').gotoTerminal(3)<CR>]], { silent = true }, desc = 'Harpoon Term 3' },
    -- { ',1', [[:lua require('harpoon.term').sendCommand(1, 1)<CR>]], { silent = true }, desc = 'Harpoon Cmd 1' },
    -- { ',2', [[:lua require('harpoon.term').sendCommand(1, 2)<CR>]], { silent = true }, desc = 'Harpoon Cmd 1' },
    -- { ',3', [[:lua require('harpoon.term').sendCommand(1, 3)<CR>]], { silent = true }, desc = 'Harpoon Cmd 2' },
    -- { ',4', [[:lua require('harpoon.term').sendCommand(1, 4)<CR>]], { silent = true }, desc = 'Harpoon Cmd 3' },

    --     -- Querty homerow
    --     { ',e', [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]], { silent = true }, desc = 'Harpoon Menu' },
    --     { ',m', [[:lua require('harpoon.mark').add_file()<CR>]], { silent = true }, desc = 'Harpoon Mark' },

    --     { ',a', [[:lua require('harpoon.ui').nav_file(1)<CR>]], { silent = true }, desc = 'Harpoon M1' },
    --     { ',s', [[:lua require('harpoon.ui').nav_file(2)<CR>]], { silent = true }, desc = 'Harpoon M2' },
    --     { ',d', [[:lua require('harpoon.ui').nav_file(3)<CR>]], { silent = true }, desc = 'Harpoon M3' },
    --     { ',f', [[:lua require('harpoon.ui').nav_file(4)<CR>]], { silent = true }, desc = 'Harpoon M4' },
    --     { ',g', [[:lua require('harpoon.ui').nav_file(5)<CR>]], { silent = true }, desc = 'Harpoon M5' },
    --     {
    --       ',c',
    --       [[:lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>]],
    --       { silent = true },
    --       desc = 'Harpoon Commands Menu',
    --     },
    --     { ',j', [[:lua require('harpoon.term').gotoTerminal(1)<CR>]], { silent = true }, desc = 'Harpoon Term 1' },
    --     { ',k', [[:lua require('harpoon.term').gotoTerminal(2)<CR>]], { silent = true }, desc = 'Harpoon Term 2' },
    --     { ',l', [[:lua require('harpoon.term').gotoTerminal(3)<CR>]], { silent = true }, desc = 'Harpoon Term 3' },
    --     { ',1', [[:lua require('harpoon.term').sendCommand(1, 1)<CR>]], { silent = true }, desc = 'Harpoon Cmd 1' },
    --     { ',2', [[:lua require('harpoon.term').sendCommand(1, 2)<CR>]], { silent = true }, desc = 'Harpoon Cmd 1' },
    --     { ',3', [[:lua require('harpoon.term').sendCommand(1, 3)<CR>]], { silent = true }, desc = 'Harpoon Cmd 2' },
    --     { ',4', [[:lua require('harpoon.term').sendCommand(1, 4)<CR>]], { silent = true }, desc = 'Harpoon Cmd 3' },
  },

  config = function()
    require('harpoon').setup {
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
        tabline_prefix = '   ',
        tabline_suffix = '   ',
      },
    }
  end,
}
