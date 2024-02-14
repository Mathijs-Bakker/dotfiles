return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  lazy = false,
  ft = { 'rust' },

  config = function()
    settings = {
      ['rust-analyzer'] = {
        server = {
          trace = {
            server = { 'verbose' },
          },
        },
      },
    }
  end,
}
