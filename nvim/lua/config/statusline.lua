local path_sep = require('plenary.path').path.sep

local function get_relative_path_filename()

    local path_head = vim.fn.expand('%:h')
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
  return string.format('%s %s %s',
    get_relative_path_filename(),
    get_file_modified_status(),
    get_file_help_status())
end

local function get_lines()
  return '%-20.( %l,%c : %L : %p%% %)'
end

local function get_lsp_status()
  local status = require('plugins.lsp-status')
  local diagnostics = status.statusline()
  return diagnostics
end

local function get_git_branch()
  local git_branch = vim.fn["fugitive#head"]()

  if not git_branch or git_branch == '' then return '' end

  return '%#WildMenu#  ' .. git_branch .. '%*'
end

local harpoon_mark = require("harpoon.mark")

local function get_harpoon_status()
  local mark_id = harpoon_mark.status()

  if not mark_id or mark_id == "" then
    return '%#WildMenu# ♆  %*'
  end

  return '%#PmenuSel# ♆ ' .. mark_id .. ' %*'
end

local function is_terminal_window()
  local buftype = tostring(Bo.buftype)

  if buftype == 'terminal' then return true end

  return false
end

local statusline = ''
local separator = '  '
local section_spacer = '%='

function StatusLine()

  if is_terminal_window() then
    statusline = '  Terminal  '
    .. get_harpoon_status()
  else
    statusline = separator
    .. get_file_status_section()
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
