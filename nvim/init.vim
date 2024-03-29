" mapleader (なんか最初に持ってこないと反映されない)
let mapleader = "\<Space>"

"dein Script -----------{{{
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/home/yk/.cache/dein'
let s:dein_src = '/home/yk/.cache/dein/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' . s:dein_src

call dein#begin(s:dein_base)
let s:toml_dir = expand('~/.config/nvim')
call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy':0})
call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
call dein#end()

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

if dein#check_install()
 call dein#install()
endif

" End dein Scripts------------------------}}}

" setting
set encoding=utf-8
set fileencodings=utf-8,sjis
set autoread
set hidden
set showcmd
set number
set cursorline
" set cursorcolumn
set conceallevel=0
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set matchtime=1
set laststatus=2
set wildmode=list:longest
set backspace=indent,eol,start
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
imap jj <Esc>
au FileType vim setlocal foldmethod=marker
nnoremap Y y$
let g:vim_json_syntax_conceal = 0
nnoremap <leader>ch :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <leader>ck :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" Tab
" set list listchars=tab:\>\- 
set tabstop=2
set shiftwidth=2
set expandtab

au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4

" 検索
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

colorscheme molokai

" カーソル記憶
if has("autocmd")
  augroup redhat
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \	if line("'\"") > 0 && line ("'\"") <= line("$") |
    \	exe "normal! g'\"" |
    \	endif
  augroup END
endif

" window mapping
nnoremap s <Nop>
" 画面移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" pane移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" 画面分割
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
" タブ関連
nnoremap st :tabnew<CR>
nnoremap sn gt
nnoremap sp gT
" タグ
set tags=tags;$HOME