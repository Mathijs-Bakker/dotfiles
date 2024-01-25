local install_packer = function()
  if vim.fn.input("Install Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/start/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading and installing packer.nvim...")
  print("(Neovim needds to be restarted)")
end

return function()
  if not pcall(require, 'packer') then
    install_packer()

    return true
  end

  return false
end
