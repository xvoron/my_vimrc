" VIMRC config file (~/.vimrc) 
" Autor: Artyom Voronin
" Date: 2020
" 
" PLUG MANAGER -> 
"
"
" Usage: >:source %
"        >:PlugInstall
"
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Usege :LLPStartPreview
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()

"Binds
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

let g:pymode_python = 'python3'
"let g:pymode = 1
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'pdflatex'


" HTML 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set et 
set wrap
set ai
set cin
set number
set showmatch
set hlsearch
set incsearch
set ignorecase

set encoding=utf-8

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

