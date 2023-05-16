syntax on

filetype plugin on
filetype indent on

set encoding=utf-8
set noerrorbells   "关闭错误信息响铃
set smartindent    "开启新行自动缩进
set nowrap
set noswapfile
set nobackup      "覆盖文件不备份
set undodir=~/.vim/undodir
set undofile
set incsearch     "输入搜索内容时就显示搜索结果
set ignorecase smartcase    "搜索时忽然大小写
set tabstop=4
set expandtab
set autoindent
" set shiftwidth=4
" set softtabstop=4
set laststatus=2
set number relativenumber  "显示相对行号
set nocompatible
" set cursorline   "显示当前行
" set ruler
" set modeline

" 设置边界条长度和颜色
set colorcolumn=120
highlight colorcolumn ctermbg=0 guibg=lightgrey


let mapleader=","
let g:mapleader=","

filetype plugin indent on

call plug#begin("~/.vim/bundle")

" org mode
" Plug 'jceb/vim-orgmode'

" Plug 'morhetz/gruvbox'
" Plug 'jremmen/vim-ripgrep'
" Plug 'leafgarland/typescript-vim'
" Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags'
" Plug 'git@github.com:kien/ctrlp.vim.git'

" html/css 编写模块
" Plug 'mattn/emmet-vim'

" 模糊查找
" Plug 'ctrlpvim/ctrlp.vim'

" 文件恢复
" Plug 'mbbill/undotree'

" go模式
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

" Plug 'ColinKennedy/vim-textobj-block-party'
" Plug 'kana/vim-textobj-user'
" Plug 'gko/vim-coloresque'

" 页面显示css颜色
" Plug 'ap/vim-css-color'

" 数据分割连接
" Plug 'AndrewRadev/splitjoin.vim'

" Plug 'junegunn/goyo.vim'
" Plug 'ervandew/supertab'

" 语法检测
" Plug 'vim-syntastic/syntastic'
" Plug 'sirver/ultisnips'
" Plug 'tpope/vim-sensible'
" Plug 'honza/vim-snippets'


" 配对括号
Plug 'jiangmiao/auto-pairs'

" 注释代码
Plug 'tpope/vim-commentary'

" 标签/字符替换
Plug 'tpope/vim-surround'

" 文件目录树
Plug 'scrooloose/nerdtree'

" 模糊查找
Plug 'junegunn/fzf.vim'

" a tagbar that learns from LSP servers
Plug 'liuchengxu/vista.vim'



" git 模块
"Plug 'tpope/vim-fugitive'
"Plug 'jreybert/vimagit'

" vim状态条
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

" python mode in vim
Plug 'python-mode/python-mode'

" 提供python特有的文本:class,functions等等
Plug 'jeetsukumaran/vim-pythonsense'

" python缩进
Plug 'Vimjas/vim-python-pep8-indent'

" asynchronous linter plugin
" checking for syntax errors and auto-fixing
Plug 'dense-analysis/ale'

Plug 'sheerun/vim-polyglot'



" 自动智能补全
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc-python'
" Plug 'ycm-core/YouCompleteMe'



" Plug 'tpope/vim-heroku'


" 调整vim启动界面
" Plug 'mhinz/vim-startify'

" Plug 'majutsushi/tagbar'
" Plug 'fatih/molokai'
" Plug 'jeffkreeftmeijer/vim-dim'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }
"Plug 'xolox/vim-notes'
"Plug 'xolox/vim-misc'
"Plug 'tamlok/vim-markdown'
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'zxqfl/tabnine-vim'
call plug#end()

" common setting

set showcmd
set showmatch

" setting colorscheme
" set background=dark
set t_Co=256       " 兼容tmux
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" 指定ale语法检查使用模块
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'ruby': ['standardrb', 'rubocop'],
    \   'javascript': ['eslint'],
    \ }

let g:ale_fixers = {'python': ['yapf']}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save=1

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e

" 每次保存文件时, 删除python和ruby文件的尾随空行
autocmd FileType python,ruby autocmd BufWritePre <buffer> :%s/\($\n\s*\)\+\%$//e

autocmd FileType json syntax match Comment +\/\/.\+$+

"autocmd BufNewFile,BufRead *.py \
"    set expandtab     |" replace tabs with spacs
"    set autoindent    |" copy indent when starting a new line
"    set tabstop=4
"    set softtabstop=4
"    set shiftwidth=4


" Folding (:help foldmethod)
"autocmd BufNewFile,BufRead *.py \
"    set foldmethod=indent

" map ctrl n to line numbers
nmap <C-N><C-N> :set invnumber<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <A-b> <c-o>b

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" comment lines
" noremap <Leader>o :Commentary<CR>

" select all and copy
" noremap <Leader>y <esc>gg"+yG<CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:pymode_lint_ignore = "E0501,C0103,R0914,C0326,C0330,W0612"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_post_args = ['--disable=C0103,W0612,R0914,C0326,C0330']
"let g:syntastic_python_pylint_post_args = ['--disable=W,line-too-long,missing-docstring,C0103,R0914,invalid-name,bad-whitespace']
       " 'too-many-public-methods,too-few-public-methods,import-error,'
       "    'no-name-in-module,not-callable,locally-disabled,bad-continuation' ]

" let g:syntastic_python_pylint_post_args =
"     \ '--module-rgx=''[a-zA-Z_][a-zA-Z0-9_]*$'' --max-line-length 120
" --indent-string=''\t''
" --disable=mixed-indentation,line-too-long,missing-docstring,too-many-public-methods,too-few-public-methods,import-error,no-name-in-module,not-callable,locally-disabled,bad-continuation'



" TagBar Setting
" nmap <F8> :TagbarToggle<CR>

" Paster mode setting
set pastetoggle=<F2>

" " set font for GUI vim
" if has("gui_running")
"      if has("win32")
"            set guifont=Hack:h10:cANSI:qDRAFT
"      else
"            set guifont=Hack\ 11
"      endif
" endif

" air-line
let g:airline_powerline_fonts = 1

" 开启tabline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.dirty='⚡'

" vim-go setting
set autowrite
set updatetime=100
let g:go_null_module_warning = 0
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


" markdown setting
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1


" YCM setting
let g:ycm_global_ycm_extra_conf = "/home/azer/.ycm_extra_conf.py"

" NERDTree setting
map <F3> :NERDTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>


" emmet setting
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" redefine trigger key
" let g:user_emmet_leader_key='<C-Z>'
