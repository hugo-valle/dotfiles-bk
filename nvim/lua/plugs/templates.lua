-- Templates should be in the template folder with file.template extension
Plug 'tibabit/vim-templates'


vim.g['tmpl_author_name'] = 'Hugo Valle'
vim.g['tmpl_author_email'] = 'hugovalle1@weber.edu'
vim.g['tmpl_company'] = 'WSU'

vim.cmd [[
    let g:tmpl_search_paths = ['~/.config/nvim/templates']
    ]]
