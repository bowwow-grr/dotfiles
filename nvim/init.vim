"dein Script -----------{{{
if &compatible
	set nocompatible
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME

let s:dein_dir = s:cache_home . '/dein'

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# 'dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let s:toml_dir = expand('~/.config/nvim')
	
	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy':0})
	call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

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
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
au FileType vim setlocal foldmethod=marker

" Tab
set list listchars=tab:\>\- 
set tabstop=2
set shiftwidth=4

" 検索
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

colorscheme molokai
