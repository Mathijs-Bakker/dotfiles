return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, 
    function() require("flash").jump({ 
      search = { 
	forward = true 
      }, 
    }) 
    end, 
    desc = "Jump Forward" },
    { "S", mode = { "n", "x", "o" }, 
    function() require("flash").jump({ 
      search = { 
	forward = false 
      }, 
    }) 
    end, 
    desc = "Jump Backward" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  highlight = {
    -- show a backdrop with hl FlashBackdrop
    backdrop = false,
  },
}
