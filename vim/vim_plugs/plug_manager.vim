"=================================================================
"  Revision  38
"  Modified  Wednesday, 20 October 2021
"=================================================================

"=================================================================
" Vim-Plug Plugin Manager Auto Install {
"=================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup plugmanager
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
    augroup end
endif
"} ===

"=================================================================
"= #### Plugin Options #### {
"=================================================================
call plug#begin('~/.vim/bundle')

" personal configs
source $HOME/dotfiles/vim/vim_plugs/jvim.vim
" Browsing, Project Explorer
source $HOME/dotfiles/vim/vim_plugs/nerdtree.vim
" Fuzzy Finder
source $HOME/dotfiles/vim/vim_plugs/fzf.vim
source $HOME/dotfiles/vim/vim_plugs/startify.vim
" Theme
source $HOME/dotfiles/vim/vim_plugs/color_scheme.vim
" Airline theme
source $HOME/dotfiles/vim/vim_plugs/airline.vim
" Source Control: git, github, etc
source $HOME/dotfiles/vim/vim_plugs/fugitive.vim
" Tmux support
source $HOME/dotfiles/vim/vim_plugs/vim-tmux.vim
" Syntax and Language support
source $HOME/dotfiles/vim/vim_plugs/ale.vim
source $HOME/dotfiles/vim/vim_plugs/bash_support.vim
"source $HOME/dotfiles/vim/vim_plugs/language_support.vim
"source $HOME/dotfiles/vim/vim_plugs/coc.vim

Plug 'tibabit/vim-templates'
let g:tmpl_author_email = 'john.doe@example.com'
"} ===

"=================================================================
" Super tab completion
"=================================================================
"Plug 'ervandew/supertab'
"} ===


"=================================================================
" Better Syntax Support
"=================================================================
"
"Plug 'sheerun/vim-polyglot'
"} ===

"=================================================================
" Auto Pairs for '(', '[' '{'
"=================================================================
"
"Plug 'jiangmiao/auto-pairs'
"} ===


"=================================================================
" TagBar - Requires Exuberant Ctags {
"=================================================================
" Activate with TagbarOpen or Ctrl-T
" Jump to tag defenition: Ctrl-]
"Plug 'majutsushi/tagbar'
"nnoremap <C-t> :TagbarToggle<CR>
"nnoremap <silent><C-]> <C-w><C-]><C-w>T
"map <Leader>y :TagbarToggle<CR>
"let g:tagbar_width = 30
"}===



"=================================================================
" AnyFold Plugin
"=================================================================
" :h fold-commands: zo, zO, zc, za, etc
" Even better to use Fold Cycling Plugin
"Plug 'pseewald/vim-anyfold'
"let anyfold_activate=1
"set foldlevel=0
"set foldlevelstart=20
"augroup anyfold
"autocmd!
"    autocmd User anyfoldLoaded normal zv
"    autocmd BufWinEnter * normal! zR
"augroup END
"} ===



"=================================================================
" Fold Cycling Plugin {
"=================================================================
" provides the avility to cycle open and closed folds and
" nested folds
"Plug 'arecarn/vim-fold-cycle'
"let g:fold_cycle_default_mapping = 0 "disable default mappings
"nmap <Tab><Tab> <Plug>(fold-cycle-open)
"nmap <S-Tab><S-Tab> <Plug>(fold-cycle-close)
"} ===


"=================================================================
" TMUX integration {
"=================================================================
" <Ctrl + [h,j,k,l]> Move to vim panes and tmux widows
"Plug 'christoomey/vim-tmux-navigator'
"} ===


"=================================================================
" Code Snippets {
"=================================================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger='<tab>'
"let g:UltiSnipsJumpForwardTrigger='<Nul>'
"let g:UltiSnipsJumpBackwardTrigger='<C-S-d>'
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit='vertical'
" Track the engine.
"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"} ===


"=================================================================
" File search
"=================================================================
"
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
"Plug 'junegunn/fzf.vim'
"nnoremap <C-p> :FZF<CR>
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-s': 'split',
"  \ 'ctrl-v': 'vsplit'
"  \}
" requires silversearcher-ag
" used to ignore gitignore files
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"} ===

"=================================================================
" COC Setup: Needs Vim 8.02 or higher
"=================================================================

"
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
"=================================================================
" Startify: The fancy start screen for vim {
"=================================================================
" :SLoad    load a session
" :SSave    save a session
" :SDelete  delete a session
" :SClose   close current session
"
"Plug 'mhinz/vim-startify'
"let g:startify_fortune_use_unicode = 1
"let g:startify_session_persistence = 0
"let g:startify_bookmarks = [ {'c': '~/.vimrc'} ]
"=================================================================
" Startify: The fancy start screen for vim
" Created by: figlet -f slant "Dr. Valle"
"=================================================================
"let g:startify_custom_header = [
"            \'',
"            \'        ____            _    __      ____   ',
"            \'        / __ \_____     | |  / /___ _/ / /__ ',
"            \'       / / / / ___/     | | / / __ `/ / / _ \',
"            \'      / /_/ / /  _      | |/ / /_/ / / /  __/',
"            \'     /_____/_/  (_)     |___/\__,_/_/_/\___/ ',
"            \'',
"            \'',
"            \]
"} ===



"=================================================================
"=####################= END Plugin System =######################=
"=================================================================
call plug#end()
set synmaxcol=1000      " Only syntax hightlight 1000 columns right
