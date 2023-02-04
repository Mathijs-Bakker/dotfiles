local alpha = require 'alpha'
-- local startify = require 'alpha.themes.startify'

-- startify.section.header.val = {}

-- startify.section.top_buttons.val = {
--   startify.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
-- }

-- alpha.setup(require('alpha.themes.startify').opts)

local dashboard = require 'alpha.themes.dashboard'

dashboard.section.header.val = {
  [[   ]],
  [[ 01101110 00110011 00110000 01110110 00110001 01101101 ]],
}

dashboard.section.buttons.val = {
  -- dashboard.button(',e', '♆ Harpoon', [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]]),
  dashboard.button(',e', '♆ Grapple', [[:lua require('grapple').popup_tags()<CR>]]),
  dashboard.button('<Ldr> ff', ' Find File ', ':Telescope find_files<CR>'),
  dashboard.button('<Ldr> fr', ' Frecency/MRU ', ':Telescope frecency<CR>'),
  dashboard.button('<Ldr> fp', '﯑ Projects', ':Telescope projects<CR>'),
  dashboard.button('<Ldr> fw', ' Grep Word', ':Telescope grep_string<CR>'),
  dashboard.button('e', ' New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('up', ' Update Plugins', ':PackerUpdate <CR>'),
  dashboard.button('ch', '﫵Check Health', ':checkhealth <CR>'),
}

alpha.setup(require('alpha.themes.dashboard').opts)
