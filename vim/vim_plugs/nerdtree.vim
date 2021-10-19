"=================================================================
"  Revision  33
"  Modified  Tuesday, 09 March 2021
"=================================================================

"=================================================================
" NerdTree [Ctrl-B] {
"=================================================================
" Plug 'preservim/nerdtree'
 Plug 'preservim/nerdtree' |
             \ Plug 'Xuyuanp/nerdtree-git-plugin' |
             \ Plug 'ryanoasis/vim-devicons'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFocus<CR>
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
"autocmd BufWinEnter * silent NERDTreeMirror

" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

"} ===

