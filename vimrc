"==========Default Vim Texts==========
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible              " be iMproved, required
filetype off                  " required


"==========VundleVim==========
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" auto-completion
Plugin 'ycm-core/YouCompleteMe'

" navigation tree
Plugin 'preservim/nerdtree'

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

"==========NERDTree==========
" open a NERDtree when vim starts up with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"==========Pure Vim Configuration==========
" Show line numbers
set number

" show filename in bottom left
set statusline+=%F

" show line number, column, page% in bottom right
set ruler

" constantly show file name and path
set laststatus=2

" tabs to spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" newlines stat at last indent
set autoindent

" turn on search highlight and turn off when you are no longer searching
nnoremap <esc><esc> :silent! nohls<cr>

" Search down into subfoldes
set path+=**
set wildmenu

"set filetype to typescript whenever file extension '*.ts' is opened
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

"auto complete matching pair 
"inoremap { {<CR>}<Esc>ko
inoremap { {}
inoremap ( ()
inoremap [ []

"==========All Key Bindings==========
" map key combination for changing Vim windows 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" copy/cut/paste to file. useful when global buffer not available over ssh
noremap <S-Y> :'<,'> w! /tmp/vimcopy<CR>
noremap <S-D> :'<,'> w! /tmp/vimcopy <bar> :'<,'> d<CR>
noremap <S-P> :r /tmp/vimcopy<CR>

" Remap kj to escape from insert mode
inoremap kj <esc>

" bind fj to indent whole file (mark p, gg, =G, go back to the mark p)
nnoremap fj :normal mpgg=G`p<cr> 

" close all Vim windows except current 
map <S-k> :only<CR>

" toggle NERDtree [NERDTree]
map <S-n> :NERDTreeToggle<CR>

