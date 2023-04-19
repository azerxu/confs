set encoding=utf-8
set noerrorbells   " 关闭错误信息响铃
set smartindent    " 开启新行自动缩进
set nowrap         " 不换行
set noswapfile     " 不产生swap文件
set autowrite      " 退出文件时,自动保存文件
set laststatus=2   " 显示状态栏和标题栏
set incsearch      "输入搜索内容时就显示搜索结果
set ignorecase smartcase    "搜索时忽然大小写
set termguicolors  " 设置真色彩

" 设置边界条长度和颜色
set colorcolumn=100

" yank copy to system clipboard
set clipboard=unnamedplus

set number relativenumber  " 显示相对行号

" map ctrl n to line numbers
" nmap <C-N><C-N> :set invnumber<CR>

"" for checkhealth ignore perl setting
let g:loaded_perl_provider = 0


call plug#begin('~/.local/share/nvim/site/plugged')
" 设置airline
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Plug 'nvim-lualine/lualine.nvim'
" " If you want to have icons in your statusline choose one of these
" Plug 'nvim-tree/nvim-web-devicons'

" Vim notify
Plug 'rcarriga/nvim-notify'

" 配色方案
Plug 'tanvirtin/monokai.nvim'

" 设置vim pane 放大缩小和tmux一样 <C-W>m
Plug 'dhruvasagar/vim-zoom'

" python mode in neovim
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" 提供python特有的文本:class,functions等等
Plug 'jeetsukumaran/vim-pythonsense'

" python缩进
Plug 'Vimjas/vim-python-pep8-indent'

" 自动智能补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'fannheyward/coc-pyright'

" 语法检测和自动修复
Plug 'dense-analysis/ale'

" 配对括号
Plug 'jiangmiao/auto-pairs'

" 注释代码
Plug 'tpope/vim-commentary'

" 标签/字符替换
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

" 文件目录树
Plug 'scrooloose/nerdtree'

" 模糊查找
" Plug 'junegunn/fzf.vim'

" A tagbar that learns from LSP servers
Plug 'liuchengxu/vista.vim'

"语法高亮
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" sudo save
Plug 'lambdalisue/suda.vim'

call plug#end()

" 指定ale语法检查使用模块
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'ruby': ['standardrb', 'rubocop'],
    \   'javascript': ['eslint'],
    \ }

" 使用yapf格式化python文件
let g:ale_fixers = {'python': ['yapf']}
let g:ale_fix_on_save=1
nmap <F10> :ALEFix<CR>

" 设置terminal
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e

" Automatic reloading of init.vim
autocmd! bufwritepost init.vim source %

" let mapleader=","
" let g:mapleader=","
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Escap
map <A-;> :<Esc>

" switch buffer
noremap <Leader>n :bnext<CR>
noremap <Leader>p :bprevious<CR>

" delete current buffer
noremap <Leader>d :bd<CR>

" comment lines
noremap <Leader>o :Commentary<CR>
map <A-o> :Commentary<CR>

" select all and copy
noremap <Leader>y <esc>gg"+yG<CR>

" 保存文件
noremap <Leader>w :w<CR>
map <A-w> :w<CR>

" 退出界面
map <A-q> :q<CR>

" 水平分割界面
map <A-_> :isplit<CR>

" 垂直分割界面
map <A-v> :vsplit<CR>

" zoom panes like tmux
map <A-z> <Plug>(zoom-toggle)

" NERDTree setting
map <F3> :NERDTreeToggle<CR>

" Vista.vim Setting
nmap <F8> :Vista!!<CR>

" 删除空白字符
noremap <A-\> diw

" 回退删除一个单词
noremap <A-BS> bdw

" 打开terminal
nmap <A-t> :vnew term://bash<CR>

" Paster mode setting
set pastetoggle=<F2>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <A-j> <c-w>j
map <A-k> <c-w>k
map <A-l> <c-w>l
map <A-h> <c-w>h

" auto pair fly mode setting
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutToggle = '<M-p>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'

" add <!-- --> pair and remove '{' for html file
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--': '-->'}, ['{'])
au FileType php  let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

" Airline setting
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" 配色方案
" colorscheme monokai
colorscheme monokai_pro
" colorscheme monokai_soda
" colorscheme monokai_ristretto

" sandwich setting like vim-surround
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \   {
      \     'buns'        : ['{', '}'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['add'],
      \     'linewise'    : 1,
      \     'command'     : ["'[+1,']-1normal! >>"],
      \   },
      \   {
      \     'buns'        : ['{', '}'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['delete'],
      \     'linewise'    : 1,
      \     'command'     : ["'[,']normal! <<"],
      \   }
      \ ]



" Some servers have issues with backup files
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" 每次保存文件时, 删除python和ruby文件的尾随空行
autocmd FileType python,ruby autocmd BufWritePre <buffer> :%s/\($\n\s*\)\+\%$//e

" 转换python文件的tab为4个空格
autocmd BufNewFile,BufRead *.py
    \  set expandtab     |" replace tabs with spacs
    \  set autoindent    |" copy indent when starting a new line
    \  set tabstop=4
    \  set softtabstop=4
    \  set shiftwidth=4

" 运行python程序
map <A-r> :!python %<CR>

" 使用yapf格式化python文件
let g:ale_fixers = {'python': ['yapf']}



let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Ensure you have installed some decent font to show these pretty symbols,
" then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
"       \    'func': "\u0192",
"       \    'function': "\u0192",
"       \    'functions': "\u0192",
"       \    'var': "\u00d7",
"       \    'variable': "\u00d7",
"       \    'variables': "\u00d7",
"       \    'const': "\uf8ff",
"       \    'constant': "\uf8ff",
"       \    'constructor': "\u046a",
"       \    'method': "\u038f",
"       \    'package': "\u06de",
"       \    'packages': "\u06de",
"       \    'enum': "\u0583",
"       \    'enummember': "\u056d",
"       \    'enumerator': "\u0583",
"       \    'module': "\u0444",
"       \    'modules': "\u0444",
"       \    'type': "\u0442",
"       \    'typedef': "\u0442",
"       \    'types': "\u03a8",
"       \    'field': "\u03dc",
"       \    'fields': "\u03dc",
"       \    'macro': "\u047e",
"       \    'macros': "\u047e",
"       \    'map': "\u0472",
"       \    'class': "\uf0e8",
"       \    'augroup': "\u042e",
"       \    'struct': "\u0372",
"       \    'union': "\u0376",
"       \    'member': "\u0398",
"       \    'target': "\u03e0",
"       \    'property': "\u03f7",
"       \    'interface': "\u041F",
"       \    'namespace': "\u040f",
"       \    'subroutine': "\u03a9",
"       \    'implementation': "\u041f",
"       \    'typeParameter': "\u03dc",
"       \    'default': "\u06e9"
" \  }


