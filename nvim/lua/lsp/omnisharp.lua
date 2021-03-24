local home = os.getenv("HOME")
local omnisharp_bin = home .. "/Repositories/language-servers/omnisharp-osx/run"
local pid = vim.fn.getpid()

require('lspconfig').omnisharp.setup({
   cmd = {
      omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)
   },
   on_attach = on_attach
})
