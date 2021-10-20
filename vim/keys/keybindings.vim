"=================================================================
"  Revision  106
"  Modified  Thursday, 01 April 2021
"=================================================================

"=================================================================
" Mappings and Keybindings {
"     Every unnecessary keystroke that can be saved is good for
"     your health :)
"=================================================================
" zM   "Close all folds
" zR   "Open all folds

" Easier moving between tabs
nnoremap <Leader>n <Esc>:tabprevious<CR>
nnoremap <Leader>m <Esc>:tabnext<CR>

" Sort visual mode selected lines
vnoremap <Leader>s :sort<CR>

nnoremap <C-/> <Esc>:nohl<CR>   " Remove highlight from search
inoremap <C-/> <Esc>:nohl<CR>i  " Remove hightight from search

" mac os make <FN+Arrows> work as CTRL+Arrows
if has('macunix')
    map <ESC>[5~ <C-Up>
    map <ESC>[6~ <C-Down>
    map <ESC>OH <C-Left>
    map <ESC>OF <C-Right>
endif

" You can't stop me
cmap w!! w !sudo tee %
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <Leader><TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
" use ctr:+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Tabs Navigation
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>

" Copy and paste
"set clipboard=unnamed
"if has('clipboard') && !has('gui_running')
"    vnoremap <C-y> "+y
"    vnoremap <C-d> "+d
"    vnoremap <C-p> "+p
"    inoremap <C-v> <C-r><C-o>+
"endif

"} ===

if &diff
        " Your setting you want to set when using diff mode.
        "nnoremap <expr> <C-J> &diff ? ']c' : '<C-W>j'
        nnoremap <Leader>n ]c
        nnoremap <Leader>N [c
        " Built-in shortcut: do
        nnoremap <Leader>] :diffget<CR>
        " Built-in shortcut: dp
        nnoremap <Leader>] :diffget<CR>
        nnoremap <Leader>[ :diffput<CR>
        nnoremap <Leader>u :diffupdate<CR>
endif

"=================================================================
" Shift-K Help support {
"=================================================================
" Use <Shift-K> to lookup help for word under the cursor
augroup shift-K
    autocmd!
    autocmd FileType cpp set keywordprg=cppman
    autocmd FileType c set keywordprg=man\ -S3
augroup END
"} ===
nnoremap < silent > <leader> 0 : source ~/ .vimrc \| :PlugInstall<CR>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>