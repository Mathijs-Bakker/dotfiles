Cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("stylua-nvim").format_file()
  augroup END
]]
