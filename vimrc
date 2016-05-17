set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kshenoy/vim-signature'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'tpope/vim-fugitive'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'wesQ3/vim-windowswap'
Plugin 'keith/swift.vim'
Plugin 'vim-utils/vim-man'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'

" Syntax-specific plugins
Plugin 'lervag/vim-latex'
Plugin 'groenewege/vim-less'
Plugin 'vim-scripts/mako.vim'
Plugin 'hynek/vim-python-pep8-indent'

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
let g:mapleader=","           " it's better mapped to here
set encoding=utf-8
set splitright              " open vsplits to the right, by default

" Use extended mouse mode, even in tmux
if &term =~ '^screen'
    set ttymouse=xterm2
endif

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

" MacVim-specific 
if has("gui_running")
    set guifont=Monaco:h10
    set guioptions=gm
    set noantialias
endif

" make backspace do the right thing
set backspace=indent,eol,start

" clear highlights easily
nnoremap <leader>n :noh<CR>

" search
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

" make space highlight all occurances of word under cursor
nmap <space> *N

" fast buffer switching 
nmap <Tab>   :bn<CR>
nmap <S-Tab> :bp<CR>
nnoremap <leader>l :e#<CR>
nnoremap <leader>q :Bclose<CR>
nnoremap <leader>m :CtrlPBuffer<CR>

" choose buffer easily from buffers menu
nmap <F5> :BufExplorer<CR>
nmap <F6> :CtrlPBuffer<CR>

" close windows easily
nnoremap <leader>c :close<CR>
nnoremap <leader>C :Bclose<CR> :close<CR>

" color scheme
colors zenburn
highlight clear SignColumn  " something's been messing with the sign column
                            " color...might be removable in the future

" tagbar setup 
map <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1

" NERDTree setup
map <F7> :NERDTree<CR>
let NERDTreeIgnore=['\.pyc']
let NERDTreeWinSize=40
autocmd FileType nerdtree set relativenumber

" tags
set tags=tags;/ " will search for 'tags' file from current directory to /
nnoremap <c-]> g<c-]>   " swap tag jump commands to show a menu on multiple tags
vnoremap <c-]> g<c-]>
" g + c-] will jump to the tag (prompting for selection if necessary) in a
" vsplit to the right of the current window
nnoremap g<c-]> :rightbelow vert stjump <c-r><c-w><cr>
vnoremap g<c-]> :rightbelow vert stjump <c-r><c-w><cr>

" ctrlp config -- file finder
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 100 " try to reduce lagginess in ym

" ctrlp tag switching (use the same ctrlp shortcut, but leader first)
nnoremap <leader><c-p> :CtrlPTag<CR>
vnoremap <leader><c-p> :CtrlPTag<CR>

" ctrlp-funky function jump
nnoremap <leader>j :CtrlPFunky<CR>

" ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" column ruler: highlights the character that goes past the 80th column.
set colorcolumn=81
set winwidth=84
set tw=79
set formatoptions+=t

" when opening things, after plugins mess with formatoptions, set ours
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" vim-airline statusline configuration
let g:airline_powerline_fonts = 0
set laststatus=2

" disable airline plugins that are slow
let g:airline#extensions#tagbar#enabled = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_pep8_args = ['--ignore=E501']

" syntax associations
au BufNewFile,BufRead *.mako setlocal syntax=mako
"
" tabline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 0

" gitgutter config - prevent it from lagging vim on buffer switch
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ack lookup -- don't <cr> on these so that I can adjust the command before
" running
nnoremap <leader>k  :!ack '<c-r><c-w>'<left>
vnoremap <leader>k  :!ack '<c-r><c-w>'<left>

" filetype autocmds -- associate filetypes with syntaxes
au BufRead,BufNewFile *.kit setfiletype html

" replace builtin man page lookup with :Vman, which will open the man page in a
" vertical split. move the cursor back before the word, and position it so that
" the section number can be added in a single keystroke.
nnoremap K  :Vman <c-r><c-w><s-left><left><space>
vnoremap K  :Vman <c-r><c-w><s-left><left><space>
