-- Formatter

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  -- Don't need a key map for formatting.
  -- as I will use :w anyways.
  -- keys = {
  --   {
  --     -- Customize or remove this keymap to your liking
  --     '<leader>fm',
  --     function()
  --       require('conform').format { async = true, lsp_fallback = true }
  --     end,
  --     mode = '',
  --     desc = 'Format buffer',
  --   },
  -- },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      -- go = { 'goimports' },
      go = { 'gofmt' },
      -- javascript = { { 'deno_fmt', stop_after_first = true } },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = false },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { '-i', '2' },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
