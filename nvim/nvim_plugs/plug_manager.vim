"=================================================================
"  Revision  1
"  Modified  Tuesday, 28 September 2021
"=================================================================

"=================================================================
" Vim-Plug Plugin Manager Auto Install {
"=================================================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup plugmanager
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
    augroup end
endif
"} ===

"=================================================================
"= #### Plugin Options #### {
"=================================================================
call plug#begin('~/.config/nvim/bundle')

" Inteligent
source $HOME/.config/nvim/nvim_plugs/coc.vim
" File Fuzzy Finder
"source $HOME/dotfiles/vim/vim_plugs/fzf.vim


"=================================================================
"=####################= END Plugin System =######################=
"=================================================================
call plug#end()
set synmaxcol=1000      " Only syntax hightlight 1000 columns right
