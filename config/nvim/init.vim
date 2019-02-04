set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

" Feature plugins, ordered in order of importance to me
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-buftabline'
Plug 'jlanzarotta/bufexplorer'
Plug 'airblade/vim-gitgutter'
Plug 'wesQ3/vim-windowswap'
Plug 'Yggdroot/indentLine'    " use :IndentLinesToggle
Plug 'junegunn/vim-easy-align'
Plug 'brooth/far.vim'
Plug 'sbdchd/neoformat'

" Style plugins
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'posva/vim-vue'

" Syntax-specific plugins
Plug 'lervag/vim-latex'
Plug 'groenewege/vim-less'
Plug 'vim-scripts/mako.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'AndrewRadev/vim-eco'
Plug 'keith/swift.vim'
Plug 'vim-scripts/pydoc.vim'
Plug 'dag/vim-fish'

" Initialize plugin system
call plug#end()

" General settings
set rnu                     " relative line numbering
syntax enable               " syntax highlighting
set nowrap                  " disable wrap
set mouse=a                 " enable mouse mode
set foldmethod=indent       " fold anything predictably
set foldlevelstart=20       " auto-unfold up to 20 level of folds
set hidden                  " allows buffers to be hidden w/o writing changes
let g:mapleader=","         " it's better mapped to here
set encoding=utf-8          " vim defaults to $LANG or latin1
set splitright              " open vsplits to the right, by default
set exrc                    " look for config files in current directory
set clipboard=unnamed       " use system clipboard

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

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
nnoremap <leader>m :Buffers<CR>

" choose buffer easily from buffers menu
nmap <F5> :BufExplorer<CR>
nmap <F6> :Buffers<CR>

" close windows easily
nnoremap <leader>c :close<CR>
nnoremap <leader>C :Bclose<CR> :close<CR>

" appearance
highlight clear SignColumn 
set background=light
colors tomorrow-night

" fzf file finder
nnoremap <c-p> :Files<CR>
vnoremap <c-p> :Files<CR>

" NERDTree setup
map <F7> :NERDTreeFocus<CR>
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

" tag switching
nnoremap <leader><c-p> :Tags<CR>
vnoremap <leader><c-p> :Tags<CR>

" tags in the current buffer
nnoremap <leader>j :BTags<CR>

" ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" column ruler: highlights the character that goes past the 80th column.
set colorcolumn=121
"set winwidth=87
"set tw=79
set formatoptions+=t

" highlight the current line
set cursorline

" when opening things, after plugins mess with formatoptions, set ours
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" gitgutter config - prevent it from lagging vim on buffer switch
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ack lookup -- don't <cr> on these so that I can adjust the command before
" running
nnoremap <leader>k  :Ack '<c-r><c-w>'<left>
vnoremap <leader>k  :Ack '<c-r><c-w>'<left>
let g:ackprg = 'ag --nogroup --nocolor --column' " use ag, which is better than ack, which is better than grep
let g:ack_use_dispatch = 1                       " async job control

" support searching with :grep using ag
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" filetype recognition
au BufRead,BufNewFile *.kit set ft=html
au BufNewFile,BufRead *.mako setlocal syntax=mako
au BufRead,BufNewFile *.podspec setfiletype ruby
au BufRead,BufNewFile Podfile setfiletype ruby
au BufRead,BufNewFile Jenkinsfile setfiletype groovy
au BufRead,BufNewFile *.jenkinsfile setfiletype groovy 
let g:tex_flavor = "latex"  " default to latex filetype

" replace builtin man page lookup with :Vman, which will open the man page in a
" vertical split. move the cursor back before the word, and position it so that
" the section number can be added in a single keystroke.
nmap K  :Vman <c-r><c-w><s-left><left><space>
vmap K  :Vman <c-r><c-w><s-left><left><space>

" disable tablines by default
let g:indentLine_enabled = 0

" EasyAlign mappings
" start in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start on a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" deoplete (keyword completion) settings
let g:deoplete#enable_at_startup = 1

" use vim-dispatch to run xcodebuild commands
let g:xcode_runner_command = ':Start! {cmd}\'

" watch for changes to files _only in a gui_
" this behavior works nicely when i'm working back and forth from an IDE
if has("gui_vimr") || has("gui_running")
  au FocusGained * checktime " VimR doesn't support this yet - qvacua/vimr#368
  au InsertEnter * checktime
endif
