local home = os.getenv ( "HOME" )

-- LUA:
local sumneko_lua_root_path =  home .. "/Repositories/language-servers/lua-language-server"

require('lspconfig').sumneko_lua.setup({
   cmd = {
      sumneko_lua_root_path .. "/bin/macOS/lua-language-server",
      "-E",
      sumneko_lua_root_path .. "/main.lua"
   },
   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim", "map", "filter", "range", "reduce", "head", "tail", "nth", "describe", "it", "use" },
            disable = {"redefined-local"}
         },
         runtime = {version = "LuaJIT"},
         workspace = {
            library = {
               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
               [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
               -- ['usr/local/bin/busted'] = true,
               --[require 'busted'(busted)] = true,
               -- [require 'busted.runner'({standalone = false})] = true,
               --[require "nvim-treesitter.utils".get_package_path() .. "/lua"] = true,
            },
         },
      },
   },
   on_attach = on_attach,
})
