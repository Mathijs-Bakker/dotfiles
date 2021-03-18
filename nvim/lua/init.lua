-- require 'lsp'
require('mb.lsp')

require('mb.globals')

require('mb.telescope')
require('mb.telescope.mappings')
require('completion')

Presence = require('presence'):setup({
    auto_update       = true,
    editing_text      = "Editing %s",
    workspace_text    = "Working on %s",
    neovim_image_text = "Neovim 0.5",
    main_image        = "neovim",
    client_id         = "793271441293967371",
    log_level         = nil,
})

 -- if true then
 --   -- Load required packages
 --   local neorocks = require("plenary.neorocks")
 --   print(neorocks)

 --   neorocks.install('penlight', 'pl')
 --   neorocks.install('luasocket', 'socket')

 --   neorocks.ensure_installed('penlight', 'pl')
 --   neorocks.ensure_installed('lua-cjson', 'cjson')
 --   neorocks.ensure_installed('luasocket', 'socket')
 --   neorocks.ensure_installed('moses', 'moses')
 -- end
