-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------
-- SET OPTIONS
-- +--------------------+------------------------+
-- |       VIM          |   Lua                  |
-- +--------------------+------------------------+
-- | set hlsearch       | vim.o.hlsearch = true  |
-- | set number         | vim.wo.number = true   |
-- | set shiftwidth=4   | vim.bo.shiftwidth = 4  |
-- +--------------------+------------------------+
-- Scopes:
-- vim.o    -- gets or sets general settings
-- vim.wo   -- gets or sets window-scope options
-- vim.bo   -- gets or sets buffer-scope options
-- vim.g    -- gets or sets global variables
-- vim.env  -- gets or sets environment variables
-- vim.opt  -- gets or sets global, window, and buffer setttings

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' '             -- change leader to a space
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.wrap = false
opt.relativenumber = true
opt.hidden = true
opt.wildmode = {"list", 'longest'}
vim.opt.mouse         = 'a'	    -- Enable mouse mode


g.onedark_style = 'darker'
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.colorcolumn = '80'        -- line lenght marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow      = true 	-- Force Split Below
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary
opt.autoindent    = true    -- auto indent
opt.cursorline    = true    -- show cursor line
opt.autowrite     = true    -- auto save file
opt.hlsearch        = true 	-- Set highlight on search
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.smartindent = true    -- autoindent new lines
opt.smarttab        = true	-- Smart Tabs
local indent = 4
opt.expandtab = true      -- use spaces instead of tabs
opt.tabstop           = indent           -- 1 tab == 4 spaces
opt.softtabstop     = indent
opt.shiftwidth      = indent
opt.scrolloff       = 12  	  -- Vertical Scroll Offset
opt.sidescrolloff   = 8  	    -- Horizontal Scroll Offset

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]


-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-- Vim specific
-----------------------------------------------------------
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight
opt.breakindent     = true	    -- Enable break indent
opt.backup          = false	    -- Disable Backup
opt.swapfile        = false	    -- Don't create Swap Files
opt.spell           = false
opt.undofile        = true 	    -- Save undo history
opt.updatetime      = 250	        -- Decrease update time
opt.timeoutlen      = 250	        -- Time for mapped sequence to complete (in ms)
opt.inccommand      = 'nosplit'   -- Incremental live completion
opt.fileencoding    = "utf-8"	    -- Set File Encoding
opt.spelllang       = "en"
opt.undodir         = vim.fn.stdpath("cache") .. "/undo"
-- stylua: ignore end
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true      -- enable 24-bit RGB colors
cmd [[colorscheme onedark]]

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = '|'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
cmd [[autocmd FileType markdown let g:indentLine_enabled=0]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
--opt.completeopt = 'menuone,noselect,noinsert'

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
--cmd [[command Term :botright split term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- disable nvim intro
opt.shortmess:append "sI"
