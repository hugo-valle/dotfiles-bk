"=================================================================
" File search
"=================================================================
"
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
"Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

nnoremap <C-p> :FZF<CR>
"let g:fzf_action = {
"   'ctrl-t': 'tab split',
"   'ctrl-s': 'split',
"   'ctrl-v': 'vsplit'
"  }
" requires silversearcher-ag
" used to ignore gitignore files
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"} ===

