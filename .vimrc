
syntax on
filetype on

colorscheme PaperColor
"colorscheme Tomorrow-Night

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

autocmd quickfixcmdpost *grep* cwindow
autocmd quickfixcmdpost *make* copen
autocmd BufNewFile,BufRead * match ZenkakuSpace / /
autocmd FileType c,cpp,cc,cxx,h,hpp,hxx,hh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType perl,html,py,sh,jar,php,rs setlocal cindent expandtab
autocmd FileType yaml,yml,repos,toml,xml,urdf,launch setlocal ts=2 sts=2 sw=2 expandtab

let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
let mapleader = "\<Space>"

nnoremap <silent><Leader>q :q<CR>
nnoremap <silent><Leader>w :wa<CR>
nnoremap <silent><Leader>v :vs<CR>
nnoremap <silent><Leader>s :sp<CR>
nnoremap <silent><Leader>= <C-w>=
nnoremap <silent><Leader>, <C-w>10<
nnoremap <silent><Leader>. <C-w>10>
nnoremap <silent><Leader>h <C-w>h
nnoremap <silent><Leader>j <C-w>j
nnoremap <silent><Leader>k <C-w>k
nnoremap <silent><Leader>l <C-w>l
nnoremap <silent><Leader>H <C-w>H
nnoremap <silent><Leader>J <C-w>J
nnoremap <silent><Leader>K <C-w>K
nnoremap <silent><Leader>L <C-w>L
nnoremap <silent><Leader>t :tabnew<CR>
nnoremap <silent><Leader>b :tab ba<CR>
nnoremap <silent><Leader>[ :term<CR>
nnoremap <silent><Leader>m :make<CR><CR><C-w><C-w>
nnoremap <silent> <Leader>f :Rg<CR>

inoremap <silent>jj <Esc>
inoremap <silent>JJ <Esc>

nnoremap ; :
nnoremap : ;

nnoremap <silent>+ <C-a>
nnoremap <silent>- <C-x>
nnoremap <silent>gr :tabprevious<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <silent><C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <silent><C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <silent><Up> <C-w>k
nnoremap <silent><Down> <C-w>j
nnoremap <silent><Left> <C-w>h
nnoremap <silent><Right> <C-w>l
nnoremap <silent><S-Left> :tabprevious<CR>
nnoremap <silent><S-Right> :tabnext<CR>

set number
set ruler
set title
set writebackup
set hidden
set smartindent
set smarttab
set showcmd
set cursorline
set showmatch
set hlsearch
set incsearch
set autoread
set autoindent
set wildignorecase
set expandtab

set nocompatible
set noswapfile
set nobackup
set nostartofline
set noerrorbells

set background=dark
set fencs=utf-8,iso-2022-jp,enc-jp,cp932
set fileencoding=utf-8
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4

if has('nvim')
    set mouse=
    set clipboard=unnamed
else
    set clipboard=unnamed,autoselect
endif
set scrolloff=5
set visualbell t_vb=
set virtualedit=onemore
set wildmode=list:full

set t_Co=256
set laststatus=2
set statusline=%<\ %{expand('%:p:h')}/%{expand('%:p:t')}\ %m%r%w%h\ %=\ Encode=%{&fenc!=''?&fenc:&enc}\ \|\ Format=%{&ff}\ \|\ FileType=%Y\ \|\ Char=0x%02.2B\ \|\ Position=%l/%L,(%v)\ \|\ Persent=%3p%%

let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif


