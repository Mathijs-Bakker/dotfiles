vim.opt.laststatus = 3

local path_sep = require('plenary.path').path.sep

local function get_relative_path_filename()
  local path_head = vim.fn.expand '%:h'
  -- print("ph " .. path_head)
  if path_head ~= '' then
    path_head = path_head .. path_sep
  end

  return '%#StatusLineNC# ' .. path_head .. '%*%#CursorLineNr#%t %*'
end

local function get_file_modified_status()
  return '%m'
end

local function get_file_help_status()
  return '%h'
end

local function get_file_status_section()
  return string.format('%s %s %s', get_relative_path_filename(), get_file_modified_status(), get_file_help_status())
end

local function get_lines()
  return '%-20.( %l,%c : %L : %p%% %)'
end

local function get_lsp_status()
  local status = require 'utils.lsp-status'
  local diagnostics = status.statusline()
  return diagnostics
end

local function get_git_branch()
  local git_branch = vim.fn['FugitiveHead']()

  if not git_branch or git_branch == '' then
    return ''
  end

  return '%#WildMenu#  ' .. git_branch .. '%*'
end

local function is_terminal_window()
  local buftype = tostring(vim.bo.buftype)

  if buftype == 'terminal' then
    return true
  end

  return false
end

-- local harpoon_mark = require 'harpoon.mark'

-- local function get_harpoon_status()
--   local mark_id = harpoon_mark.status()

--   if not mark_id or mark_id == '' then
--     return '%#WildMenu# ♆  %*'
--   end

--   return '%#PmenuSel# ♆ ' .. mark_id .. ' %*'
-- end

-- local harpoon = require 'harpoon'

-- local function normalize_path(path)
--   if not path then
--     return ''
--   end
--   return vim.fn.fnamemodify(vim.fn.expand(path), ':p')
-- end

-- local function get_harpoon_status()
--   local list = harpoon:list()
--   local items = list.items or {}

--   local current = normalize_path(vim.api.nvim_buf_get_name(0))
--   local mark_id = nil

--   for i, item in ipairs(items) do
--     if item and item.path then
--       local item_path = item.path:gsub('\\', '/') -- normalize slashes
--       local current_rel = current:gsub('\\', '/')
--       if current_rel:sub(-#item_path) == item_path then
--         mark_id = i
--         break
--       end
--     end
--   end

--   local layout = vim.g.harpoon_current_layout or '?'

--   if not mark_id then
--     return string.format('%%#WildMenu# ♆  [%s] %%*', layout)
--   end

--   return string.format('%%#PmenuSel# ♆ %d [%s] %%*', mark_id, layout)
-- end

local statusline = ''
local separator = '  '
local section_spacer = '%='

function StatusLine()
  if is_terminal_window() then
    -- statusline = '  Terminal  ' .. get_harpoon_status()
  else
    statusline = separator
      .. get_file_status_section()
      .. separator
      .. get_git_branch()
      .. separator
      -- .. get_harpoon_status()
      .. section_spacer
      .. get_lsp_status()
      .. section_spacer
      .. get_lines()
      .. separator
  end

  return statusline
end

vim.o.statusline = '%!v:lua.StatusLine()'
