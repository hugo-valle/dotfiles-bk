"=================================================================
"  Revision  8
"  Modified  Sunday, 28 February 2021
"=================================================================
"=================================================================
" jvim plugin options {
"=================================================================
Plug 'john-warnes/jvim'
let g:JV_showEol=1       " Show EOL marker
let g:JV_codePretty = 1  " Show indent guides when
let g:Jvim#vimopts#colorColumn        = 81 " Set long line guide
"let g:Jvim#vimopts#useSystemClipboard = 1  " Try to use system clipboard

let g:Jvim#highlightRed = 'GruvboxRedBold' " Highlight to link for Red

let g:Jvim#hidden#showTrailing = 1 " Show Tailing Spaces
let g:Jvim#hidden#showEol      = 0 " Show EOL marker
let g:Jvim#hidden#showIndent   = 0 " Show indent guides when (F2 Toggles)
let g:Jvim#hidden#codePretty   = 1 " Replace some chars with alternatives (F2 Toggles)

let g:Jvim#presistentUndo#enable = 1 " Use persistent Undo
let g:Jvim#presistentUndo#dir    = expand($DOTFILES.'/vim/undo') " Where to store persistent files

let g:Jvim#folding#syntax = 1 " Enable folding by syntax for all files
                              "  NOTE: Might be slow on older systems
let g:Jvim#folding#fold   = 3 " Folding Mode on File Open
                              " 0: none default vim
                              " 1: open all folds on file open
                              " 2: close all folds on file open
                              " 3: Auto save folds and reload them
                              "  NOTE: <t><t> in normal mode to toggle folds

let g:Jvim#quickFix#enable     = 0  " Enable auto resizing of the quick fix window
let g:Jvim#quickFix#heightMin  = 3  " Limit the MIN size of the quick fix window
let g:Jvim#quickFix#heightMax  = 10 " Limit the MAX size of the quick fix window

let g:Jvim#metadata#enable     = 1 " enable metadata auto update on file save
let g:Jvim#metadata#maxSearch  = 50 " Max lines at top of file to search for meta data tags
let g:Jvim#metadata#dateFormat = '%A, %d %B %Y' " Format for template and metadata dates (man date)

let g:Jvim#comment#enable      = 1 " Allow comment and uncomment system
"} ===

