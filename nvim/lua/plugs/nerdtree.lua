--=======================================================
-- NerdTree [Ctrl-e] {
--=======================================================
-- pass second param
Plug('scrooloose/nerdtree', {on = 'NERDTreeToggle'})
Plug('Xuyuanp/nerdtree-git-plugin') 
Plug('ryanoasis/vim-devicons')

-- Source configuration
vim.cmd 'source ~/.config/nvim/vim_plugs/nerdtree.vim'

--vim.g['NERDTreeQuitOnOpen'] = '0' -- close NERDTree after  file is opened
---> to hide unwanted files <---
--vim.g['NERDTreeIgnore'] = {'__pycache__', '.pyc$', '.o$', '.swp',  '*.swp',  'node_modules/'  }
--vim.g['NERDTreeShowHidden'] = '1' -- show hidden files in NERDTree
--vim.g['NERDTreeWinSize'] = '15'
--vim.g['NERDTreeMinimalUI'] = '1'
--vim.g['NERDTreeIgnore'] = '[]'
--vim.g['NERDTreeStatusline'] = ''
