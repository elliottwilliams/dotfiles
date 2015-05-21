set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" Plugins I (Elliott) added
Plugin 'lervag/vim-latex'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'szw/vim-tags'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/workflowish'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set rnu
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax enable
set autoindent
set nowrap
set mouse=a
set rnu

" MacVim 
if has("gui_running")
  set guifont=Source\ Code\ Pro:h12
endif

" make backspace do the right thing
set backspace=indent,eol,start

" search
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

" color scheme
set background=dark
colorscheme solarized

" neocomplete setup
let g:neocomplete#enable_at_startup = 1

" tagbar setup 
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" tags
set tags=tags;/ " will search for 'tags' file from current directory to /
let g:ctrlp_max_files = 0

" column ruler: highlights the character that goes past the 80th column.
highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)
set colorcolumn=81
set winwidth=84
"set tw=79
"set formatoptions+=t

" vim-airline statusline configuration
let g:airline_powerline_fonts = 1
set laststatus=2

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
