"=================================================================
"  Revision  11
"  Modified  Sunday, 28 February 2021
"=================================================================

"=================================================================
" Airline Status Line and TmuxLine {
"=================================================================
let g:airline#extensions#tagbar#enabled = 0 "tagbar plugin is slow disable it
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'   "Lots of themes
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%F'              " Show full Path if possable
"let g:airline_theme='base16'               " Pick a theme
"let g:airline_theme='murmur'                " or
"let g:airline_theme='powerlineish'         " or
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tmuxline#color_template = 'insert'
Plug 'edkolev/tmuxline.vim'     "have airline theme the tmux bar
"} ===
