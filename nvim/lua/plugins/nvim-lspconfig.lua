-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- for language server setup see: https://github.com/neovim/nvim-lspconfig

local nvim_lsp = require('lspconfig')


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

-- Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }


end

--[[

Language servers:

Add your language server to `servers`

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

Bash --> bashls
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls

Python --> pyright
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright

C-C++ -->  clangd
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd

HTML/CSS/JSON --> vscode-html-languageserver
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html

JavaScript/TypeScript --> tsserver
https://github.com/typescript-language-server/typescript-language-server

--]]

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'bashls', 'pyright', 'ccls', 'cmake', 'html', 'tsserver' , 'gopls', 'rust_analyzer'}

-- Set settings for language servers below
--
-- tsserver settings
local ts_settings = function(client)
  client.resolved_capabilities.document_formatting = false
  ts_settings(client)
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
  on_attach = on_attach, capabilities = capabilities, ts_settings = ts_settings,
  flags = {
    debounce_text_changes = 150,
  }
}
end

--following is the setup for the language servers
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup{
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {"javascript", "javascriptreact", "javascript.jsx",
               "typescript", "typescriptreact", "typescript.tsx",
               ".css"},
  capabilities = capabilities,
}

--C / C++ Settings
require 'lspconfig'.ccls.setup {
  cmd = {"clangd", "--background-index"},
  filetypes = {"c", "cpp", "objc", "objcpp"},
  --root_dir = require"nvim_lsp/util".root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname,
  capabilities = capabilities,
}

--Bash Settings 
require 'lspconfig'.bashls
      .setup{
          cmd = {"bash-language-server", "start"},
          cmd_env = {GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"},
          filetypes = {"sh"},
          capabilities = capabilities,
      } require 'lspconfig'.cssls.setup {
  filetypes = {".css", ".scss", ".sass", ".less"}, capabilities = capabilities;
}

require 'lspconfig'.html.setup {
  cmd = {"html-languageserver", "--stdio"}, filetypes = {".html"},
  capabilities = capabilities;
}
