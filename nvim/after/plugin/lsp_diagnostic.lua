-- Global diagnostic configuration.
-- Functions and keymappings that let you open a Location List with
-- diagnostic errors or jumpable errors, warnings, etc. sorted by severity.

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  float = {
    show_header = true,
    border = 'rounded',
    -- source = "always",
    format = function(diagnostic)
      if not diagnostic.code and not diagnostic.user_data then
        return diagnostic.message
      end

      local t = vim.deepcopy(diagnostic)
      local code = diagnostic.code
      if not code then
        if not diagnostic.user_data.lsp then
          return diagnostic.message
        end

        code = diagnostic.user_data.lsp.code
      end
      if code then
        t.message = string.format('%s [%s]', t.message, code):gsub('1. ', '')
      end
      return t.message
    end,
  },
  severity_sort = true,
  update_in_insert = false,
}

local severity_levels = {
  vim.diagnostic.severity.ERROR,
  vim.diagnostic.severity.WARN,
  vim.diagnostic.severity.INFO,
  vim.diagnostic.severity.HINT,
}

local get_highest_error_severity = function()
  for _, level in ipairs(severity_levels) do
    local diags = vim.diagnostic.get(0, { severity = { min = level } })
    if #diags > 0 then
      return level, diags
    end
  end
end

vim.keymap.set('n', 'dp', function()
  vim.diagnostic.goto_prev {
    severity = get_highest_error_severity(),
    wrap = true,
    float = true,
  }
end)

vim.keymap.set('n', 'dn', function()
  vim.diagnostic.goto_next {
    severity = get_highest_error_severity(),
    wrap = true,
    float = true,
  }
end)

vim.keymap.set('n', '<Leader>dl', function()
  vim.diagnostic.open_float(0, { scope = 'line' })
end)

Nnoremap('<Leader>ll', '<cmd>lua vim.diagnostic.setloclist()<CR>') -- List Location List
Nnoremap('<Leader>lf', '<cmd>lua vim.diagnostic.setqflist()<CR>') -- List quickFix
