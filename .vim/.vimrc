" mapleader
let mapleader = "\<Space>"

"{{{
call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" docker
Plug 'skanehira/docker.vim'

" colorscheme
Plug 'tomasr/molokai'

" vim lightline
Plug 'itchyny/lightline.vim'

" Denite 
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" vim-toml
Plug 'cespare/vim-toml'
call plug#end()

" open browser command, deafult is 'open'
let g:docker_open_browser_cmd = 'open'

" split temrinal windows, can use vert or tab, etc...
" see :h vert
let g:docker_terminal_open = 'bo'

" check plugin's version when plugin loading.
" default is checking.
" If you not want to check, please set 0 to this option.
let g:docker_plugin_version_check = 1

" this is registry auth info.
" if you want to push an image, please set your auth info.
let g:docker_registry_auth = {
	\ 'username': 'your name',
	\ 'password': 'your password',
	\ 'email': 'your email',
	\ 'serveraddress': 'https://docker.io/',
	\ }

" you can also read auth info from json file.
" if you manage vimrc on GitHub, we recommend using json file.
"let s:docker_auth_file = expand('~/.docker/docker.vim.json')
"let g:docker_registry_auth = json_decode(join(readfile(s:docker_auth_file), "\n"))
"
" NERDTree
map <silent><C-n> :NERDTreeToggle<CR>

" vim lightline
let g:lightline = {
  \ 'colorscheme': 'molokai',
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
nnoremap <silent> <Space>f :Denite file/rec<CR>
"}}}

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
set belloff=all
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
au FileType vim setlocal foldmethod=marker
nnoremap Y y$
let g:vim_json_syntax_conceal = 0

" Tab
" set list listchars=tab:\>\- 
set tabstop=2
set shiftwidth=2

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
