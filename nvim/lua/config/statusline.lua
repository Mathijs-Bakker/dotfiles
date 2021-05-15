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
  return ' %l,%c : %L : %p%%'
end

local lsp_status = require('lsp-status')

local function get_lsp_status()
  local status = lsp_status.status()

  if not status or status == '' then return '' end

  return status
end

local function get_git_branch()
  local git_branch = vim.fn["fugitive#head"]()

  if not git_branch or git_branch == '' then return '' end

  return ' ' .. git_branch
end

local status = require("harpoon.mark").status()

local function get_harpoon_status()
  if status == "" then status = "" end
  return string.format("♆ %s", status)
end

local function is_term()
  local buftype = tostring(Bo.buftype)

  if buftype == 'terminal' then return true end

  return false
end

local statusline = ''
local separator = '  '
local section_spacer = '%='

function StatusLine()

  if is_term() then
    statusline = '  Terminal  '
    .. get_harpoon_status()
  else
    statusline = separator
    .. get_file_status()
    .. separator
    .. get_git_branch()
    .. separator
    .. get_harpoon_status()
    .. section_spacer
    .. get_lsp_status()
    .. section_spacer
    .. get_lines()
    .. separator
  end

  return statusline
end

O.statusline = '%!v:lua.StatusLine()'
