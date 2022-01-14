
set rtp+=~/.vim/photon/color
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = "hard"
color gruvbox
hi Normal guibg=NONE ctermbg=NONE
hi CursorLine   cterm=NONE ctermbg=232
augroup CursorLine
   au!
   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
   au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
   au WinLeave * setlocal nocursorline
augroup END

