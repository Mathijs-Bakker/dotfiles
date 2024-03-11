return {
  'j-hui/fidget.nvim',
  -- tag = 'v1.3.0',
  enable = false,
  opts = {
    -- options
  },
  config = function()
    require('fidget').setup {
      notification = {
        -- poll_rate = 10, -- How frequently to update and render notifications
        filter = vim.log.levels.INFO, -- Minimum notifications level
        history_size = 256, -- Number of removed messages to retain in history
        override_vim_notify = true, -- Automatically override vim.notify() with Fidget
      },
    }
  end,
}
