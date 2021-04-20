"=================================================================
"  Revision  6
"  Modified  Sunday, 28 February 2021
"=================================================================

"=================================================================
" Gnome-Terminal ONLY {
"=================================================================
" <F7> cycle though mono powerline fonts
let g:powerlineFonts= [
            \'DejaVu Sans Mono for Powerline',
            \'Droid Sans Mono for Powerline',
            \'Droid Sans Mono Dotted for Powerline',
            \'Droid Sans Mono Slashed for Powerline',
            \'Fria Mono for Powerline'
            \'Go Mono for Powerline',
            \'Hack',
            \'Inconsolata for Powerline',
            \'Inconsolata-dz for Powerline',
            \'Inconsolata-g for Powerline',
            \'Literation Mono Powerline',
            \'Monofur for Powerline',
            \'Noto Mono for Powerline',
            \'NovaMono for Powerline',
            \'Roboto Mono for Powerline',
            \'Space Mono for Powerline'
            \'Ubuntu Mono derivative Powerline',
            \]

let g:font='DejaVu Sans Mono for Powerline'
let g:fontsize='11'

function! GnomeTermSetFont()
    call system ("dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/font \"\'" . g:font . ' ' . g:fontsize . "\'\"")
endfunction

function! GnomeTermCycleFont()
    call add(g:powerlineFonts, g:font)
    let g:font = get(g:powerlineFonts,0,'mono')
    let g:powerlineFonts=g:powerlineFonts[1:]
    call system ("dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/font \"\'" . g:font . ' ' . g:fontsize . "\'\"")
    echom g:font
endfunction

nnoremap <F7> :call GnomeTermCycleFont()<CR>
"} ===


"=================================================================
" Vim Color Support and Force
"=================================================================
if ($COLORTERM ==? 'truecolor')
    if has('termguicolors')
        set termguicolors
    endif
    if exists('$TMUX')
        let g:gruvbox_italic=0
        set t_ut=
    else
        let g:gruvbox_italic=1
        set t_ut=
    endif
else
    " No truecolor welcome to bad times
    " Hope term supports 256 colors
    let g:gruvbox_italic=0
    set term=xterm-256color
    set t_Co=256
    set t_ut=
endif

if $TERM ==? 'linux'
    " If Term is linux then we are in a 9 color environment
    let g:gruvbox_italic=0
    set t_Co=8
endif

if has('mac')
    let g:gruvbox_italic=0
endif

"=================================================================
" Color Scheme {
"=================================================================
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
if has('gui_running')
    set background=light
else
    set background=dark
endif

" colorscheme wombat256mod
" colorscheme default
silent! colorscheme gruvbox " colorscheme support truecolor
"} ===


" EOF != <= >= x^2 y^3 1^2 pi 44^2 pie    
"=================================================================
" Highligth column 80.
"=================================================================
if has('g:colors_name')
    if g:colors_name = "gruvbox"
        let &colorcolumn=join(range(81,84),",")
    else
        set colorcolumn=80
    endif
else
    hi clear Folded
    hi Folded term=standout cterm=standout gui=standout
    set colorcolumn=80
endif
