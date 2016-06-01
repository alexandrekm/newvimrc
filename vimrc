" ---------------------------------------------------- PLUGINS
"
" plugin management for vim, reference: https://www.digitalocean.com/community/tutorials/how-to-use-vundle-to-manage-vim-plugins-on-a-linux-vps
set nocompatible
filetype off
let $GIT_SSL_NO_VERIFY = 'true'
set rtp+=/u/mendonca/.vim/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
" fixes NERDtree directory
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on
filetype plugin on
syntax on
let g:SuperTabContextDefaultCompletionType = "<c-n>"
nmap <F6> :TagbarToggle<CR>

let g:airline_theme='sol'
" -------------------------------------------------------- personal configs
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set incsearch                  " do incremental searching
set nobackup                   " Disable the creation of backup files (the ones ending with ~)
set mouse=a                    " enable mouse 'all'
set number                     " line numbers
set showmatch                  " Show matching brackets when text indicator is over them
set wildmode=longest,list      " TAB completion (such as bash)
set laststatus=2               " Always show a status bar
set smartcase                  " Ignore case when search pattern is all lowercase
set noerrorbells               " No annoying sound on errors
set novisualbell               " No annoying sound on errors
set clipboard=unnamedplus      " Allows clipboard to be shared amongst all windows
let mapleader = ","
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
colorscheme jellybeans
" Move between windows using ctrl-[hjkl]
nnoremap <silent> <C-K> <C-W>k
nnoremap <silent> <C-J> <C-W>j
nnoremap <silent> <C-H> <C-W>h
nnoremap <silent> <C-L> <C-W>l

" Python ident configurations
if has("autocmd")
  filetype plugin indent on
  autocmd filetype python set expandtab
  autocmd filetype python set tabstop=4
  autocmd filetype python set shiftwidth=4
  autocmd filetype python set softtabstop=4
endif
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" -------------------- Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_python_exec = '/u/tcadprod/qametrics/users/mendonca/tcadprodP4/TcadPynga/python/bin/python3'
let g:syntastic_python_flake8_exec = '/u/tcadprod/qametrics/users/mendonca/tcadprodP4/TcadPynga/python/bin/flake8'
let g:syntastic_python_mypy_exec = '/u/tcadprod/qametrics/users/mendonca/tcadprodP4/TcadPynga/python/bin/mypy'
let g:syntastic_python_mypy_args = '--implicit-any'
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"let g:syntastic_cpp_checkers = ['']
"let g:syntastic_c_checkers = ['']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:flake8_cmd="/u/mendonca/.local/bin/flake8"
let g:flake8_show_in_file=1  " show
" Persistent undo
set undodir=$HOME/.vim/undodir
set undofile
let g:tagbar_ctags_bin = "/u/rafaelw/tools/ctags-5.8-1/usr/bin/ctags"
let g:tagbar_sort = 0
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_show_line_numbers = 2
map <F2> :P4edit<CR>
let g:NERDCustomDelimiters = { 'python': { 'left': '# ' } }
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\,cover', 'share', 'parts',  'include', 'htmlcov', 'egg', 'bin']
