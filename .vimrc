set nocompatible 
filetype off

let $CONFIG_DIR = "~/"

" vundle config"
let $VUNDLE_CONFIG = $CONFIG_DIR.".vimrc_vundle"
if filereadable(expand($VUNDLE_CONFIG))
  source $VUNDLE_CONFIG
endif

" 键位映射"
let $KEY_MAP = $CONFIG_DIR.".vimrc_keymap"
if filereadable(expand($KEY_MAP))
  source $KEY_MAP
endif

" vim theme"
" colorscheme molokai
set background=dark

" NERDTree"
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F5> :NERDTreeToggle<cr>

" Tagbar"
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" parse markdown"
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3'
  \ ]
\ }

" jsctag"
let g:tagbar_type_javascript = {
  \ 'ctagsbin' : 'jsctags'
\ }


" airline"
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" tslint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:typescript_compiler_binary = 'tslint'
let g:typescript_compiler_options = ''
let g:syntastic_javascript_checkers = []
let g:syntastic_html_checkers=['tidy']
autocmd FileType typescript :set makeprg=tslint
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"clang-format

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -2,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AlignConsecutiveAssignments" : "true",
            \ "IndentWidth" : 2,
            \ "ColumnLimit" : 100,
            \ "Standard" : "Auto"}
" let g:clang_format#auto_format_on_insert_leave=1    "退出插入模式时自动格式化

" vim-markdown"
let g:table_mode_corner="|"
let g:vim_markdown_folding_disabled = 1

" emmet.vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" 常规配置"


" " 自动语法高亮
 syntax on
" 检测文件类型
filetype on
" 检测文件类型插件
filetype plugin on
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" 显示行号
set number
" 上下可视行数
set scrolloff=6
" replace tab with space
set expandtab
" 设定 tab 长度为 2
set tabstop=2
" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=2
" 设定 << 和 >> 命令移动时的宽度为 2
set shiftwidth=2
set smarttab
set history=1024
" 不突出显示当前行
" set nocursorline
" 覆盖文件时不备份
set nobackup
" 自动切换当前目录为当前文件所在的目录
set autochdir
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 关闭错误声音
set noerrorbells
set novisualbell
"set t_vb=

" 不自动换行
"set nowrap
"How many tenths of a second to blink
set mat=2
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
" 智能自动缩进
set smartindent
" 设定命令行的行数为 1
set cmdheight=1
" 显示状态栏 (默认值为 1, 无法显示状态栏)
" set laststatus=2
"显示括号配对情况
set showmatch

" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
set display=lastline
" 设置在状态行显示的信息
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

" 显示Tab符
" set list
" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl

set foldenable
" 设置 leader 键，例子为空号键，也可以设置为其他的
let mapleader=","


