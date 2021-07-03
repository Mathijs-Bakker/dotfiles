local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,
    ['h']     = actions.up,
    ['q']     = actions.quit,
    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['D']     = actions.delete,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['M'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
    ['B']     = require'lir.bookmark.actions'.list,
    ['ba']     = require'lir.bookmark.actions'.add,
  },
  float = {
    winblend = 15,
    -- You can define a function that returns a table to be passed as the third
    -- argument of nvim_open_win().
    win_opts = function()
      local width = math.floor(vim.o.columns * 0.6)
      local height = math.floor(vim.o.lines * 0.8)
      return {
        border = require("lir.float.helper").make_border_opts({
          "+", "─", "+", "│", "+", "─", "+", "│",
        }, "Normal"),
        width = width,
        height = height,
        row = 10,
        col = math.floor((vim.o.columns - width) / 2),
      }
    end,
  }
}
-- custom folder icon
require'nvim-web-devicons'.setup({
  override = {
    lir_folder_icon = {
      icon = "",
      color = "#7ebae4",
      name = "LirFolderNode"
    },
  }
})

Nnoremap('<Leader>e', [[:edit %:h<CR>]])

-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(
  0, 'x', 'J',
  ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})
end
vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]

local b_actions = require'lir.bookmark.actions'
require'lir.bookmark'.setup {
  bookmark_path = '~/.lir_bookmark',
  mappings = {
    ['l']     = b_actions.edit,
    ['<C-s>'] = b_actions.split,
    ['<C-v>'] = b_actions.vsplit,
    ['<C-t>'] = b_actions.tabedit,
    ['<C-e>'] = b_actions.open_lir,
    ['B']     = b_actions.open_lir,
    ['q']     = b_actions.open_lir,
  }
}

require'lir.git_status'.setup({
  show_ignored = true
})
