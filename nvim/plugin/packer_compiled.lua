-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/MateoPanadero/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["fugitive-gitlab.vim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/fugitive-gitlab.vim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitlinker.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["lir-bookmark.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/lir-bookmark.nvim"
  },
  ["lir-git-status.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/lir-git-status.nvim"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/lir.nvim"
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
  ["nvim-reload"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/refactoring.nvim"
  },
  ["rooter.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/rooter.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-pasta"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-pasta"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-twiggy"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-twiggy"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["yaml-vim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/yaml-vim"
  },
  ["zoom-vim"] = {
    loaded = true,
    path = "/Users/MateoPanadero/.local/share/nvim/site/pack/packer/start/zoom-vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
