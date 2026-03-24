return {
  'olimorris/codecompanion.nvim',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/mcphub.nvim',
  },
  opts = {
    interactions = {
      chat = {
        adapter = {
          name = 'openai_responses',
          model = 'gpt-5.3-codex',
        },
      },
      inline = {
        adapter = {
          name = 'openai_responses',
          model = 'gpt-5.3-codex',
        },
      },
    },

    adapters = {
      http = {
        openai_responses = function()
          return require('codecompanion.adapters').extend('openai_responses', {
            env = {
              api_key = 'OPENAI_API_KEY',
            },
            schema = {
              model = {
                default = 'gpt-5.3-codex',
              },
            },
          })
        end,
      },
    },

    opts = {
      log_level = 'DEBUG',
    },
  },
}
