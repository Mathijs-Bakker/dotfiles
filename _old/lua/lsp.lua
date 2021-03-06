local function map(key, vim_lsp_command)
   local bufnr = 0
   local mode = 'n'
   local opts = { noremap=true, silent=true, nowait=true }

   local cmd = '<cmd>lua ' .. vim_lsp_command .. '<CR>'

   vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)

end

print("LSP.LUA")
-- local completion = require'completion'
local completion = require'compe'

local default_keybindings = function()
   -- Show Line Diagnostics
   map('<Leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
   -- Go to Definition:
   map('gd', 'vim.lsp.buf.definition()')
   -- Hover:
   map('K', 'vim.lsp.buf.hover()')
   -- Signature Help:
   map('<C-k>', 'vim.lsp.buf.signature_help()')
   -- Go to References:
   map('gr', 'vim.lsp.buf.references()')

   -- Rename:
   map('<Leader>rn', 'vim.lsp.buf.rename()')
end

local custom_keybindings = function()
   default_keybindings()
   -- Go to Declaration:
   map('gD', 'vim.lsp.buf.declaration()')
   -- Implementation:
   map('gi', 'vim.lsp.buf.implementation()')
   -- Type Definition:
   map('<leader>D', 'vim.lsp.buf.type_definition()')
end


local lua_attach = function()
   default_keybindings()
   completion.on_attach()
end

local omnisharp_attach = function()
   custom_keybindings()
   completion.on_attach()
end

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
            globals = { "vim", "map", "filter", "range", "reduce", "head", "tail", "nth", "describe", "it" },
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
               [require "nvim-treesitter.utils".get_package_path() .. "/lua"] = true,
            },
         },
      },
   },
   on_attach = lua_attach,
})

-- C#
local omnisharp_bin = home .. "/Repositories/language-servers/omnisharp-osx/run"
local pid = vim.fn.getpid()

require('lspconfig').omnisharp.setup({
   cmd = {
      omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)
   },
   on_attach = omnisharp_attach
})

