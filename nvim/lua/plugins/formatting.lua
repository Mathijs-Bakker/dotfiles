-- Formatter

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    local python_formatters = {}
    if vim.fn.executable 'isort' == 1 then
      table.insert(python_formatters, 'isort')
    end
    if vim.fn.executable 'black' == 1 then
      table.insert(python_formatters, 'black')
    end

    require('conform').setup {
      formatters_by_ft = {
        go = { 'gofmt' },
        html = { 'superhtml' },
        javascript = { 'deno_fmt' },
        json = { 'deno_fmt' },
        lua = { 'stylua' },
        python = python_formatters,
        typescript = { 'deno_fmt' },
        typescriptreact = { 'deno_fmt' },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = false },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2' },
        },
        deno_fmt = {
          command = 'deno',
          args = { 'fmt' },
          stdin = false,
        },
      },
    }
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
