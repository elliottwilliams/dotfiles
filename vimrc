set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'szw/vim-tags'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'airblade/vim-gitgutter'

" Syntax definition plugins
Plugin 'lervag/vim-latex'
Plugin 'groenewege/vim-less'
Plugin 'vim-scripts/mako.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" END Vundle, BEGIN all other configuration

" General settings
set rnu                     " relative line numbering
syntax enable               " syntax highlighting
set nowrap                  " disable wrap
set mouse=a                 " enable mouse mode
set foldlevelstart=20       " auto-unfold up to 20 level of folds
set hidden                  " allows buffers to be hidden w/o writing changes

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set smartindent

" MacVim-specific 
if has("gui_running")
  set guifont=Sauce\ Code\ Powerline:h13
endif

" make backspace do the right thing
set backspace=indent,eol,start

" search
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

" make space highlight all occurances of word under cursor
nmap <space> *N

" make backslash clear any highlights
"nmap \ :noh<CR>

" easier buffer switching than :bn :bp
nmap <Tab>   :bn<CR>
nmap <S-Tab> :bp<CR>

" color scheme
set background=dark
colorscheme solarized

" neocomplete setup
let g:neocomplete#enable_at_startup = 1

" tagbar setup 
map <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" NERDTree setup
map <F7> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc']
let NERDTreeWinSize=40

" tags
set tags=tags;/ " will search for 'tags' file from current directory to /

" ctrlp config -- file finder
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1 " try to reduce lagginess in ym

" ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

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

" disable syntastic by default. use C-w + E to check syntax
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" syntax associations
au BufNewFile,BufRead *.mako setlocal syntax=mako
"
" tabline config
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#tab_nr_type = 1
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#buffer_min_count = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#buffer_nr_show = 0
