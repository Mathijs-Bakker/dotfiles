return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = true,

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local harpoon = require 'harpoon'

    dashboard.section.header.val = {
      [[   ]],
      [[ 01101110 00110011 00110000 01110110 00110001 01101101 ]],
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
