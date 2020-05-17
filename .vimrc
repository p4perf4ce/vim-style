set nocompatible
filetype off

" set runtime path for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
" Initialize
call vundle#begin()

"Import Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on
" End of Initialize

" Split Screen Configuration
set splitbelow
set splitright
" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding
set foldmethod=indent
set foldlevel=99
" Folding with Spacebar
nnoremap <space> za
" SimpylFold Settings
let g:SimpylFold_docstring_preview=1

" YCM AutoCompletion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""""""""""
" Filetype Setting

" Python PEP-8 Configuration
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

" Enable Whitespace Highlighter
let g:better_whitespace_enabled=1
" Whitespace Highlight Color
let g:better_whitespace_ctermcolor=9
" Stipped Whitespace on save
let g:strip_whitespace_on_save=1
let python_highlight_all=1

" Web-Development in js html and css
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

" Generals
" Colors
syntax on
colorscheme desert

" Airline Theme
let g:airline_theme='minimalist'


set encoding=utf-8
set number
set cursorline
set tabstop=4	" numbers of spaces for <TAB> representation
set showmatch	" Show matching parentheses
set incsearch   " Search as character typed
set hlsearch	" Highlight Search
" turn off highlight with <leader>+space
nnoremap <leader><space> :nohlsearch<CR>

