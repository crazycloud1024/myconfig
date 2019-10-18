set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin()
Plug 'jiangmiao/auto-pairs'  " 自动括号
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'avakhov/vim-yaml'
Plug 'tmhedberg/SimpylFold' " 代码折叠 zo:打开  zc：关闭
Plug 'davidhalter/jedi-vim'  " go-to
Plug 'scrooloose/nerdcommenter' "添加注释
Plug 'SirVer/ultisnips'   " 补全代码块
Plug 'honza/vim-snippets'  " 代码块
Plug 'kien/ctrlp.vim' "搜索
Plug 'tell-k/vim-autopep8'
Plug '~/.fzf'
Plug 'fatih/vim-go' "go
Plug 'Yggdroot/indentLine'  "竖线
Plug 'voldikss/vim-translate-me'
Plug 'samoshkin/vim-mergetool'
Plug 'pangloss/vim-javascript'

"All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


" basic
let mapleader = ","
syntax on "语法高亮
filetype on "检查文件类型
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

set guifont=Monaco:h14
set completeopt=menu


" jedi-vim
let g:jedi#completions_enabled = 1
" open the go-to function in split, not another buffer
"let g:jedi#use_splits_not_buffers = "right""

" snipt
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" "

"Set space indent for python files
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Set space indent for javescript files
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" nerdtree
nnoremap <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.swp$']

" pep8
autocmd FileType python noremap <buffer> <F9> :call Autopep8()<CR>


"tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:gagbar_autofocus = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" vim-airline
nnoremap <C-c>n :bp<CR>
nnoremap <C-c>m :bn<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='bubblegum'
set laststatus=2  "永远显示状态栏
set t_Co=256 "


" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" ale
let b:ale_linters = {'javascript': ['eslint'], 'python': ['pyflakes', 'flake8']}
let g:ale_fixers = {'javascript': ['eslint'], 'python': ['yapf']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>e查看错误或警告的详细信息
nmap <Leader>e :ALEDetail<CR>
  

"line
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Vim
let g:indentLine_color_term = 239

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" go
let g:go_highlight_functions = 1
let g:go_highlight_method = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_version_warning = 0
 
"
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
nmap <leader>mt <plug>(MergetoolToggle)

"""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
            exec "!go run %<"
     "      exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
endfunc 

"""""""""""""""""""
" <Leader>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
hi def link vtmQuery             Identifier
hi def link vtmParaphrase        Statement
hi def link vtmPhonetic          Special
hi def link vtmExplain           Comment
hi def link vtmPopupNormal       NormalFloat
