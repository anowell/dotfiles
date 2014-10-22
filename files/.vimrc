set nocompatible

" Automatically cd into the directory that the file is in
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
set autochdir

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Who doesn't like autoindent?
set autoindent cindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Spaces >>> tab characters
set expandtab
set smarttab

" Who doesn't like autoindent?
set autoindent cindent

" Allow using the mouse
set mouse=a

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Highlight things that we find with the search
set hlsearch

" Cool tab completion stuff
set wildmenu
set wildmode=longest:full,full

" keep at least 5 lines above/below and left/right
set scrolloff=5
set sidescrolloff=5

filetype plugin indent on
syntax on
