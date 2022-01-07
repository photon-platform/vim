filetype off                  " required

set shiftwidth=2 softtabstop=2 expandtab
set autoindent
filetype plugin indent on    " required

set number relativenumber

set ignorecase
set smartcase
set incsearch
set hls

set wildmenu

set foldenable
set foldmethod=indent
set foldlevel=99

" set showtabline=2


hi CursorLine   cterm=NONE ctermbg=232
augroup CursorLine
   au!
   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
   au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
   au WinLeave * setlocal nocursorline
augroup END



let mapleader = "\<Space>"
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>h :noh<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>B :BTags<cr>
nnoremap <leader>T :Tags<cr>
nnoremap <leader>S :Snippets<cr>
nnoremap <leader>C :Commands<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>M :Maps<cr>
nnoremap <leader>Y :Commits<cr>
nnoremap <leader>H :Helptags<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>W :Windows<cr>
nnoremap <leader>w :%s/\s\+$//e<cr>

nnoremap <leader>ue :UltiSnipsEdit<cr>

" Primeagen remaps
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv

set rtp+=~/.vim/photon/color
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = "hard"
color gruvbox
hi Normal guibg=NONE ctermbg=NONE

set rtp+=~/.vim/photon/snippets
set rtp+=~/.vim/photon/snippets-utils
let g:UltiSnipsExpandTrigger="<c-x>"

set rtp+=~/.vim/photon/completion

set rtp+=~/.vim/photon/airline
set rtp+=~/.vim/photon/airline-themes

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

set rtp+=~/.vim/photon/fzf-util
set rtp+=~/.vim/photon/fzf

set rtp+=~/.vim/photon/surround

set rtp+=~/.vim/photon/comments
let g:NERDSpaceDelims = 1

set rtp+=~/.vim/photon/tags

  " Plugin 'airblade/vim-gitgutter'

  " Plugin 'godlygeek/tabular'
  
  " Plugin 'mattn/emmet-vim'

  " Plugin 'plasticboy/vim-markdown'

  " Plugin 'cakebaker/scss-syntax.vim'

  " Plugin 'vim-syntastic/syntastic'
  " Plugin 'prettier/vim-prettier'

  " Plugin 'ddevault/vimspeak'

  " Plugin 'jasonshell/vim-svg-indent'
  " Plugin 'chrisbra/unicode.vim'

  " Plugin 'GutenYe/json5.vim'


" Put your non-Plugin stuff after this line

" When working with Markdown files, grok the YAML frontmatter...
let g:vim_markdown_frontmatter = 1
" ...and don't fold
let g:vim_markdown_folding_disabled = 1

" au Filetype markdown source ~/.vim/ftplugin/markdown.vim

autocmd FileType scss set iskeyword+=-

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


imap <F5> <Esc>:w<CR>:!clear;python %<CR>
map <F5> <Esc>:w<CR>:!clear;python %<CR>

