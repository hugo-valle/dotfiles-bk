"=================================================================
"  Revision  31
"  Modified  Friday, 29 October 2021
"=================================================================

"=================================================================
" NerdTree [Ctrl-e] {
"=================================================================
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"nnoremap <C-e> :NERDTreeToggle<CR>
"nnoremap <Leader>f :NERDTreeFocus<CR>
let g:NERDTreeQuitOnOpen    =0          " close NERDTree after  file is opened
" ---> to hide unwanted files <---
let g:NERDTreeIgnore = [ '__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp',  'node_modules/'  ]
let g:NERDTreeShowHidden    =1          " show hidden files in NERDTree
let g:NERDTreeWinSize       =15
let g:NERDTreeCustomOpenArgs = {'file':{'where':'t'}}    " Open file in newtab
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '✖',
            \ 'Dirty'     : '✗',
            \ 'Clean'     : '✔︎',
            \ 'Ignored'   : '☒',
            \ 'Unknown'   : '?'
            \ }
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror
" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Automaticaly close nvim if NERDTree is only thing left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"} ===

