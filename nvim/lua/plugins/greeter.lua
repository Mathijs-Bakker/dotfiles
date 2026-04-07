return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = true,

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local v = vim.version()
    local version = string.format('v%d.%d.%d', v.major, v.minor, v.patch)

    vim.api.nvim_set_hl(0, 'AlphaGreen', { fg = '#53903f' })
    vim.api.nvim_set_hl(0, 'AlphaBlue', { fg = '#156ead' })
    vim.api.nvim_set_hl(0, 'AlphaLightGreen', { fg = '#6bb362' })

    dashboard.section.header.val = {
      '   / ╲ ││',
      '   ││╲╲││',
      '   ││ ╲ /',
      '   ',
      'NVIM ' .. version,
    }
    dashboard.section.header.opts = {
      position = 'center',
      hl = {
        {
          { 'AlphaLightGreen', 2, 8 },
          { 'AlphaGreen', 9, 15 },
        },
        {
          { 'AlphaBlue', 3, 7 },
          { 'AlphaGreen', 7, 19 },
        },
        {
          { 'AlphaBlue', 3, 7 },
          { 'AlphaLightGreen', 8, 18 },
        },
        {},
        {
          { 'AlphaGreen', 0, -1 },
        },
      },
    }

    dashboard.section.buttons.val = {
      dashboard.button(
        ',e',
        '♆ Harpoon',
        [[:lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>]]
      ),
      dashboard.button('<Ldr> ff', ' Find File ', ':Telescope find_files<CR>'),
      dashboard.button('<Ldr> fr', ' Recent Files ', ':Telescope oldfiles<CR>'),
      dashboard.button('<Ldr> fp', '﯑ Dotfiles', ':Telescope find_files cwd=~/.dotfiles<CR>'),
      dashboard.button('<Ldr> fw', ' Grep Word', ':Telescope live_grep<CR>'),
      dashboard.button('e', ' New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('up', ' Update Plugins', ':PackUpdate<CR>'),
      dashboard.button('ch', '﫵Check Health', ':checkhealth <CR>'),
    }

    alpha.setup(require('alpha.themes.dashboard').opts)
  end,
}
