-- Formatter

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      -- go = { 'goimports' },
      go = { 'gofmt' },
      html = { 'superhtml' },
      javascript = { 'deno_fmt' },
      json = { 'deno_fmt' },
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      typescript = { 'deno_fmt' },
      typescriptreact = { 'deno_fmt' },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = false },
    -- stop_after_first = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { '-i', '2' },
      },
      deno_fmt = {
        -- optional: pass extra args to deno fmt
        command = 'deno',
        args = { 'fmt' },
        stdin = false,
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
