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

set list
set listchars=tab:!·,trail:·

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
nnoremap { {zzzv
nnoremap } }zzzv


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
let wiki_phi = {'name': 'phi ARCHITECT', 'path': '~/Projects/PHIARCHITECT/notes'}
let g:riv_projects = [wiki_phi]

set rtp+=~/.vim/photon/voom
set rtp+=~/.vim/photon/jinja
" au BufNewFile,BufRead *.j2,*.jinja2,*.jinja set ft=jinja2

set rtp+=~/.vim/photon/python-syntax
let g:python_highlight_all = 1

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

helptags ALL

" this setting should help riv from having errors in long file links
set mmp=2000

autocmd FileType python noremap <Leader>K :%!black -q 2>/dev/null -<CR>
" autocmd BufWritePre *.py execute "w" | silent %!black --quiet -

" https://stackoverflow.com/questions/3828606/vim-markdown-folding
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr     

au BufEnter *.j2 setlocal syntax=j2
