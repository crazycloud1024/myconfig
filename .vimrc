set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'jiangmiao/auto-pairs'  " 自动括号
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'avakhov/vim-yaml'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'zchee/deoplete-jedi'
Plug 'tmhedberg/SimpylFold' " 代码折叠 zo:打开  zc：关闭
Plug 'davidhalter/jedi-vim'  " go-to
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'   " 补全代码块
Plug 'honza/vim-snippets'  " 代码块
"All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" basic
let mapleader = ","
syntax on "语法支持
set laststatus=2 "始终显示状态栏
set smarttab "智能制表符
set autoindent "自动缩进
set smartindent "只能缩进
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4
set number "显示行号
set ruler "显示位置指示器
set backupdir=/tmp "设置备份文件目录
set directory=/tmp "设置临时文件目录
set ignorecase "检索时忽略大小写
set hls "检索时高亮显示匹配项
set helplang=cn "帮助系统设置为中文
set foldmethod=indent "代码折叠
set foldlevel=99
set backspace=indent,eol,start
set encoding=utf-8

colorscheme molokai
set guifont=Monaco:h14
set completeopt=menu

" jedi-vim
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right""

" snypt
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"Set space indent for python files
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Set space indent for javescript files
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" deplete
let g:deoplete#enable_at_startup = 1

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


" nerdtree
nnoremap <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.swp$']


" tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:gagbar_autofocus = 1


" vim-airline
nnoremap <C-c>n :bp<CR>
nnoremap <C-c>m :bn<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='bubblegum'


" ack
let g:ackprg = 'ag --nogroup --nocolor --column'


" ale
"let g:ale_linters_explicit = 1 " TODO: bug, new buffer will not load linters
let b:ale_linters = {'javascript': ['eslint'], 'python': ['pyflakes', 'flake8']}
let g:ale_fixers = {'javascript': ['eslint'], 'python': ['yapf']}
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_python_flake8_options = '--ignore=E501,E251,E262,E127,E125,E305,W503'
nmap <leader>y <Plug>(ale_fix)
