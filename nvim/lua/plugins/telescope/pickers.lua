local Pickers = {}

--[[ Nvim ]]
function Pickers.buffers()
  require('telescope.builtin').buffers {
    shorten_path = false,
  }
end

return Pickers
