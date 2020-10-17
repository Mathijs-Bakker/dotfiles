setlocal shiftwidth=2
" The elephant in the room...
" One prefers 2 spaces, another 4,
" 3 lies in the middle, and it looks damn nicer!
setlocal tabstop=3
setlocal formatoptions-=o

" Kill 'trailing whitespace' warnings with fire:
let b:ale_warn_about_trailing_whitespace = 0
