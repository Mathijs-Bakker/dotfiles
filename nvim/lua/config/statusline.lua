-- local statusline = "%-0{minwid}.{maxwid}{item} "
-- Each status line item is of the form:
--       %-0{minwid}.{maxwid}{item}
--     All fields except the {item} are optional.  A single percent sign can
--     be given as "%%".

local function isempty(s)
  return s == nil or s == ''
end

local function get_relative_path_filename()
  return '%f'
end

local function get_modified_status()
  return '%m'
end

local function get_help_status()
  return '%h'
end

local function get_file_status()
  return get_relative_path_filename()
  .. ' ' .. get_modified_status()
  .. ' ' .. get_help_status()
end

local function get_lines()
  return ' %l r %L  %c  %p%%'
end

local lsp_status = require('lsp-status')

local function get_lsp_status()
  local status = lsp_status.status()
  print('status: ' .. status)
  -- print('sts: ' .. lsp_status.status())
  return status
end

local function get_git_branch()
  local git_branch = vim.fn["fugitive#head"]()
  if not git_branch or git_branch == '' then
    return ''
  end
  local current_branch = ' ' .. git_branch
  -- local current_branch = ' %-14.20{FugitiveHead()}'
  return current_branch
end

local function get_harpoon_status()
  local status = require("harpoon.mark").status()
  if status == "" then
    status = ""
  end

  return string.format("♆ %s", status)
end

local function is_term()
  local buftype = tostring(Bo.buftype)

  if buftype == 'terminal' then
      return true
  end

  return false
end

local statusline = ""

function StatusLine()

  if is_term() then
    statusline = '  Terminal  '
    .. get_harpoon_status()
  else
    statusline = '  '
    .. get_file_status()
    .. '  '
    .. get_harpoon_status()
    .. '   '
    .. get_git_branch()
    .. '   '
    .. get_lsp_status()
    .. '   '
    .. get_lines()
  end

  return statusline
end

O.statusline = '%!v:lua.StatusLine()'

--[[ Separators:
┊

--]]



