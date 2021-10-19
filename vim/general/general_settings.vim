"=================================================================
"  Revision  103
"  Modified  Sunday, 28 February 2021
"=================================================================
set exrc                                " if vimrc in local folder execute it
set encoding=utf-8
scriptencoding utf-8
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal foldcolumn=1
setlocal keywordprg=:help

"=================================================================
" Set the Leader Key {
"=================================================================
let g:mapleader = "\<Space>"            " set leader key
"} ===

"=================================================================
" Behavior {}
"=================================================================
set nowritebackup              " only in case you don't want a backup file while editing
set noswapfile                 " no swap files
set nobackup                   " Just overwrite the file
set printoptions=paper:letter,number:y,portrait:y
set shortmess+=filmnrxoOtT     " Abbrev. of messages (avoids 'hit enter')
set formatoptions+=cq          " Basic formatting of text and comments
set formatoptions-=t           " Don't automatically wrap text when typing
set wildmode=list:longest,full " Command <Tab> completion, list matches and
"  complete the longest common part, then,
"  cycle through the matches
set wildchar=<Tab>             " Use tab to move in the menu
"set wildchar=<Nul>
set mouse=a                    " on OSX press ALT and click
set backspace=2                " Set backspace
set backspace=indent,eol,start " Allow backspace over listed types

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> <Esc>:nohl<CR>
inoremap <C-n> <Esc>:nohl<CR>i
"} ===


"=================================================================
" cTags {
"=================================================================
"let g:gen_tags#verbose = 1        " Give more feedback
let g:gen_tags#ctags_auto_gen = 1  " Auto generate ctags if in git
let g:gen_tags#use_cache_dir  = 1  " Put tags in git or else home cache
let g:loaded_gentags#gtags    = 1  " Disable gtags support not needed
nnoremap <Leader>t :GenCtags<CR>   " if tags didn't autogen force with <Leader>t

" Backup old style ctags generator
nnoremap <Leader>T
            \ :silent execute '!(rm tags)'<CR>
            \ :silent execute '!(ctags-exuberant -R -f %:p:h/tags *)&'<CR>
            \ :redraw!<CR>
            \ :echom 'Generated cTags'<CR>
            \ execute 'set tags=./tags;~/.vim/tags;tags;'
set tags=./tags;~/.vim/tags;tags;
"} ===

"=================================================================
" Vim Editing and Behavior {
"=================================================================
syntax enable                           " Enables syntax highlighing
set clipboard=unnamedplus               " Copy paste between vim and everything else
set nocompatible               " Be vim
filetype plugin indent on
if !has('nvim') && has('nolangremap')
    set nolangremap                " avoid mapping breaks
endif
set modeline                   " Files can use modeline(s)
set modelines=10               " Check top and bottom 10 lines for modelines(s)
set hidden                     " Required to keep multiple buffers open multiple buffers
set wildmenu                   " Use the wildmenu
                               "  then, cycle through the matches
set nostartofline              " Stay on current char on page commands
set nowrap                              " Display long lines as just one line
set visualbell                 " Don't beep, flash the screen instead
set belloff=all                         " Disable sound
set scrolloff=8                " Use a 8 line (horizontal) scroll offset
set noerrorbells
set sidescrolloff=5            " Use a 5 column (virtual) scroll offset
set virtualedit=onemore        " Allow you to move the cursor to the newline
set termencoding=utf-8         " Lets try using Unicode
set wildmenu
set pumheight=10                        " Makes popup menu smaller
set cmdheight=2                         " More space for displaying messages
set laststatus=0                        " Always display the status line
set undodir=~/.vim/undodir              " For undoing history
set undofile

"map sort function to a key
vnoremap <Leader>s :sort<CR>
"} ===



"=================================================================
" Vim Look and Decorations {
"=================================================================
set ruler                   " Show the line / column number of cursor
set showcmd                 " Show the partially completed command
set number                  " Display line number"
set relativenumber                      " Set relative line numbers
set numberwidth=5           " Use 5 spaces for number column"
set textwidth=79            " Width of document (used by gd)
set nowrap                  " Don't automatically wrap on load
set commentstring=\ #\ %s   " This how fold markers look
set cursorline              " Highlight the current line
set visualbell              " Visual bell instead of beeping
set showtabline=2                       " Always show tabs
set signcolumn=yes                      " Add extra column for diagnostic
" Changes the shape of the cursor depending on the current mode
"if has('gui_running')
"    set guicursor=n-v-c:block-Cursor
"    set guicursor+=i:ver100-iCursor
"    set guicursor+=n-v-c:blinkon0
"    "set guicursor+=i:blinkwait10
"else
"    let &t_SI = "\<Esc>[6 q"
"    let &t_SR = "\<Esc>[4 q"
"    let &t_EI = "\<Esc>[2 q"
"endif
"} ===


"=================================================================
" Vim Search Options {
"=================================================================
set ignorecase             " Ignore case in search patterns
set infercase              " Don't ignore case in auto completion
                           "  but do Ignore it in search patterns
set smartcase              " Don't ignore case if pattern contains it
set incsearch              " Show the 'best match so far'
set wrapscan               " Search will wrap around the file
set hlsearch               " Highlight all matches
"} ===


"=================================================================
" Vim Indent and Programming Options {
"=================================================================
set autoindent                 " Keep indent level on new line
set nosmartindent              " Intelligent indenting for source code
set cindent                    " Intelligent indenting for source code
set cinkeys=0{,0},!^F,o,O,e    " default is: 0{,0},0),:,0#,!^F,o,O,e
set showmatch                  " Show matching brackets / parenthesis
set matchtime=5                " Show matching character for .3s
"} ===

"=================================================================
" Vertical indenting {
"=================================================================
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4 softtabstop=4             " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
"} ===


