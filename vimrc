let mapleader=","
let g:mapleader=","

call plug#begin("~/.vim/bundle")
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/nerdtree'
"Plug 'junegunn/goyo.vim'
"Plug 'ervandew/supertab'
"Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'jreybert/vimagit'
"Plug 'sirver/ultisnips'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-heroku'
"Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
"Plug 'majutsushi/tagbar'
Plug 'fatih/molokai'
Plug 'jeffkreeftmeijer/vim-dim'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }
"Plug 'xolox/vim-notes'
"Plug 'xolox/vim-misc'
"Plug 'tamlok/vim-markdown'
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'zxqfl/tabnine-vim'
call plug#end()

" common setting
set nocompatible
syntax on
filetype plugin indent on

set showcmd
set showmatch
set tabstop=4
set ts=4
set sw=4
set softtabstop=4
set expandtab
set colorcolumn=130
set number relativenumber

" setting colorscheme
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e

" map ctrl n to line numbers
nmap <C-N><C-N> :set invnumber<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" comment lines
noremap <Leader>o :Commentary<CR>

" select all and copy
noremap <Leader>y <esc>gg"+yG<CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_post_args = ['--disable=mixed-indentation,line-too-long,missing-docstring,']
       " 'too-many-public-methods,too-few-public-methods,import-error,'
       "    'no-name-in-module,not-callable,locally-disabled,bad-continuation' ]

" let g:syntastic_python_pylint_post_args =
"     \ '--module-rgx=''[a-zA-Z_][a-zA-Z0-9_]*$'' --max-line-length 120
" --indent-string=''\t''
" --disable=mixed-indentation,line-too-long,missing-docstring,too-many-public-methods,too-few-public-methods,import-error,no-name-in-module,not-callable,locally-disabled,bad-continuation'


set laststatus=2

" TagBar Setting
nmap <F8> :TagbarToggle<CR>

" Paster mode setting
set pastetoggle=<F2>

" set font for GUI vim
if has("gui_running")
     if has("win32")
           set guifont=Hack:h10:cANSI:qDRAFT
     else
           set guifont=Hack\ 11
     endif
endif

" air-line
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
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
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
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
