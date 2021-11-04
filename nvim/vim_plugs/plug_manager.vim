"=================================================================
"  Revision  81
"  Modified  Sunday, 31 October 2021
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
