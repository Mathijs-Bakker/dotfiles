" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  harpoon = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-pasta"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-pasta"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
