return {
  'chrisgrieser/nvim-spider',
  enable = false,
  keys = {
    { -- example for lazy-loading on keystroke
      'e',
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { 'n', 'o', 'x' },
    },
    { -- example for lazy-loading on keystroke
      'w',
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { 'n', 'o', 'x' },
    },

    { -- example for lazy-loading on keystroke
      'b',
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { 'n', 'o', 'x' },
    },

    -- { -- example using an explicit function
    --     'w',
    --     function()
    --       require('spider').motion('w', {
    --         customPatterns = {
    --           patterns = { ('%x'):rep(6) .. '+' },
    --           overrideDefault = true,
    --         },
    --       })
    --     end,
    --     mode = { 'n', 'o', 'x' },
    --   },
  },
}
