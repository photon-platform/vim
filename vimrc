filetype off                  " required
syntax on

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

let mapleader = "\<Space>"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>h :noh<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>w :%s/\s\+$//e<cr>


" Primeagen remaps
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv


set rtp+=~/.vim/photon/snippets-util
let g:UltiSnipsExpandTrigger="<c-x>"
nnoremap <leader>ue :UltiSnipsEdit<cr>

set rtp+=~/.vim/photon/completion

set rtp+=~/.vim/photon/airline
set rtp+=~/.vim/photon/airline-themes

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

set rtp+=~/.vim/photon/fzf-util
set rtp+=~/.vim/photon/fzf
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

set rtp+=~/.vim/photon/surround

set rtp+=~/.vim/photon/comments
let g:NERDSpaceDelims = 1

set rtp+=~/.vim/photon/tags

set rtp+=~/.vim/photon/riv
set rtp+=~/.vim/photon/voom


" Plugin 'airblade/vim-gitgutter'

" Plugin 'godlygeek/tabular'

" Plugin 'mattn/emmet-vim'

" Plugin 'plasticboy/vim-markdown'
" When working with Markdown files, grok the YAML frontmatter...
" let g:vim_markdown_frontmatter = 1
" ...and don't fold
" let g:vim_markdown_folding_disabled = 1

" au Filetype markdown source ~/.vim/ftplugin/markdown.vim

" Plugin 'cakebaker/scss-syntax.vim'
" autocmd FileType scss set iskeyword+=-

" Plugin 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Plugin 'prettier/vim-prettier'

" Plugin 'ddevault/vimspeak'

" Plugin 'jasonshell/vim-svg-indent'
" Plugin 'chrisbra/unicode.vim'



" Put your non-Plugin stuff after this line


imap <F5> <Esc>:w<CR>:!clear;python %<CR>
map <F5> <Esc>:w<CR>:!clear;python %<CR>

