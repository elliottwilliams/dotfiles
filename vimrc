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
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'christoomey/vim-tmux-navigator'

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

" make space highlight all occurances of word under cursor
nmap <space> *N

" make backslash clear any highlights
nmap \ :noh<CR>

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

" MiniBufExplorer configuration
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \b \f \l : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>l :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <TAB>     :bn<CR>
nnoremap <S-TAB>   :bp<CR>
