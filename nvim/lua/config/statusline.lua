-- local statusline = "%-0{minwid}.{maxwid}{item} "
local statusline = "%-0{minwid}.{maxwid}{item}"

function StatusLine()
  return statusline
end

O.statusline ='%v:lua.StatusLine()'
