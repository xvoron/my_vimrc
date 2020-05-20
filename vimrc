" VIMRC config file (~/.vimrc) 
" Autor: Artyom Voronin
" Date: 2020



" ==============================================================
" PLUG MANAGER -> 
"
" Usage: >:source %
"        >:PlugInstall
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Usege :LLPStartPreview
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'raingo/vim-matlab'
Plug 'jpalardy/vim-slime'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'JeroenMulkers/matvim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'jcherven/jummidark.vim'

" Initialize plugin system
call plug#end()
" ==============================================================





" ==============================================================
" COLORSCHEME 
" colorscheme sublimemonokai 
colorscheme jummidark 
" ==============================================================


" ==============================================================
" SLIME
" "Для tmux
" let g:slime_target = "tmux"

"Для обычного Вима
let g:slime_target = "vimterminal"

"Для Вима избранных
" let g:slime_target = "neovim"
" ==============================================================



" ==============================================================
" VIM-AIRLINE
" let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
" let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
" let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
" let g:Powerline_symbols='unicode' "Поддержка unicode
" let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'
" let g:airline_right_sep = ""
" let g:airline_left_sep = ""
" ==============================================================



" ==============================================================
"Binds
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
" ==============================================================

" ==============================================================
" PYMODE
let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_doc = 0
let g:pymode_doc_bind = 'K'
let g:pymode_folding = 0
let g:pymode_indent = 0
let g:pymode_lint = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore = ''
let g:pymode_lint_message = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_select = ''
let g:pymode_lint_signs = 1
let g:pymode_motion = 0
let g:pymode_options = 0
let g:pymode_paths = []
let g:pymode_quickfix_maxheight = 6
let g:pymode_quickfix_minheight = 3
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_run = 0
let g:pymode_run_bind = '<leader>r'
let g:pymode_trim_whitespaces = 0
" ==============================================================




" ==============================================================
" LATEX
" let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'pdflatex'
" let g:vimtex_view_method = 'zathura'
" let g:tex_flavor = 'latex' "Уточняем какой Тех
" USAGE <localleader>ll (или :VimtexCompile)
"Отключаем автоматическое открытие окна Quickfix
" let g:vimtex_quickfix_mode = 0
let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" ==============================================================




" ==============================================================
" HTML 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"" Type abbreviation
"   +-------------------------------------
"   | html:5_
"   +-------------------------------------
""_" is a cursor position. and type "<c-y>," (Ctrl + y and Comma)
"NOTE: Don't worry about key map. you can change it easily.
"   +-------------------------------------
"   | <!DOCTYPE HTML>
"   | <html lang="en">
"   | <head>
"   |     <title></title>
"   |     <meta charset="UTF-8">
"   | </head>
"   | <body>
"   |      _
"   | </body>
"   | </html>
"   +-------------------------------------
"Type following
"   +-------------------------------------
"   | div#foo$*2>div.bar
"   +-------------------------------------
"And type "<c-y>,"
"   +-------------------------------------
"   |<div id="foo1">
"   |    <div class="bar">_</div>
"   |</div>
"   |<div id="foo2">
"   |    <div class="bar"></div>
"   |</div>
"   | _
"   +-------------------------------------

" ==============================================================





" ==============================================================
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
" ==============================================================





" ==============================================================
" VIMWIKI
"
function! VimwikiLinkConverter(link, source_wiki_file, target_html_file)
    if a:link =~# '^local:'
      let link_infos = vimwiki#base#resolve_link(a:link)
      let html_link = vimwiki#path#relpath(
                \ fnamemodify(a:source_wiki_file, ':h'), link_infos.filename)
      let relative_link =
                \ fnamemodify(a:target_html_file, ':h') . '/' . html_link
      call system('cp ' . fnameescape(link_infos.filename) .
                \ ' ' . fnameescape(relative_link))
      return html_link
    endif
    return ''
endfunction
" VimwikiLinkConverter("./presentation.pdf",
"             \ ~/projects/site/main_site_vimwiki/projects/deep_q_learning/car_sim.md,
"             \ ~/projects/site/html/projects/deep_q_learning/car_sim.html)
" 

set nocompatible " turn off compatibilities with vi
filetype plugin on
syntax on
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'default', 'ext': '.md'}]

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'default'
let wiki_1.index = 'index'
let wiki_1.ext = '.md'
let wiki_1.path_html = '~/vimwiki/html'
let wiki_1.template_path = '~/vimwiki/templates/'
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_1.template_default = 'default'
let wiki_1.template_ext = '.html'
" let wiki_1.css_name = '~/vimwiki/css/style.css'
"
let wiki_2 = {}
let wiki_2.path = '~/Diplom/wiki/'
let wiki_2.index = 'main'
let wiki_2.syntax = 'default'
let wiki_2.ext = '.md'
let wiki_2.path_html = '~/Diplom/wiki/html'
let wiki_2.template_path = '~/Diplom/wiki/templates/'
let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_2.template_default = 'default'
let wiki_2.template_ext = '.html'

let wiki_3 = {}
let wiki_3.path = '~/projects/site/main_site_vimwiki/'
let wiki_3.syntax = 'default'
let wiki_3.index = 'index'
let wiki_3.ext = '.md'
let wiki_3.path_html = '~/projects/site/html/'
let wiki_3.template_path = '~/projects/site/main_site_vimwiki/templates/'
let wiki_3.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_3.template_default = 'default'
let wiki_3.template_ext = '.html'
" let wiki_3.vimwiki_user_htmls = 'test.html'
" let wiki_3.css_name = '~/vimwiki/css/style.css'
" let wiki_3.user_htmls = 'test.html'

let g:vimwiki_user_htmls = ''
let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]       
let g:vimwiki_use_calendar = 1 
" let g:vimwiki_user_htmls = 'test.html'
"
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'
" ==============================================================





" ==============================================================
" GENERAL THINGS FROM TUTORIALS
set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)
set autochdir   "Set auto changing directories
" CDC = Change to Directory of Current file
command CDC cd %:p:h

"Сам по себе number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсора
" set number relativenumber "А это гибридный вариант. Протестируйте все

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
" set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам

"Предыдущий способ известен как soft wrapping
"При желании вы можете заставить Вим насильно разделять...
"... строчки в самом тексте вот так:
set textwidth=80 "Где 80 стоит заменить на нужную вам длину строки

" set cursorline "А так мы можем подсвечивать строку с курсором

"Если вы используете обычный терминальный Вим, а не NeoVim, то...
"... для изменения курсора в разных режимах используйте это:
" set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
" let &t_SI.="\e[6 q" "SI = режим вставки
" let &t_SR.="\e[4 q" "SR = режим замены
" let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта
" ==============================================================

" ==============================================================
" SPELL
" setlocal spell
" set spelllang=en_us
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" ==============================================================

