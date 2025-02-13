local gd_project = vim.fn.getcwd()

if gd_project then
  -- vim.fn.serverstart './godothost'
  vim.fn.serverstart '127.0.0.1:6004'
end
