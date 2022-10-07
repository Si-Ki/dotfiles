vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require('plugins')
require('barbar-config')
require('lualine-config')
require('mappings')
require('neovim-tree')
require('treesitter')
require('mason-config')
require('cmp-config')
require('comment-config')
require('lspconfig')
require('telescope-config')

-- SETTINGS
local set = vim.opt
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local g = vim.g

set.expandtab = true
set.smarttab = true
set.tabstop = 2
set.shiftwidth = 2
set.timeoutlen = 300

set.hlsearch = false
set.incsearch = true
set.ignorecase = false
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = true
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true
set.clipboard = "unnamedplus"

set.number = true
set.relativenumber = true
set.cursorline = true

set.hidden = true

g.mkdp_auto_close = 1
g.mkdp_refresh_slow = 1
g.mkdp_browser = '/usr/bin/librewolf'
g.vimwiki_list = {{
  path = "~/.local/share/nvim/vimwiki",
  syntax = "markdown",
  ext = ".md",
}}

require("catppuccin").setup({
  transparent_background = true,})

g.catppuccin_flavour = "mocha"
cmd("colorscheme catppuccin")

autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
})

-- When shortcut files are updated, renew shell and lf configs with new stuff
autocmd("BufWritePost", {
  pattern = { "bm-dirs", "bm-files" },
  command = "!shortcuts",
})

-- Run xrdb when Xdefaults or Xresources are updated
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "Xresources", "xresources", "Xdefaults", "xdefaults" },
  command = "set filetype=xdefaults",
})

autocmd("BufWritePost", {
  pattern = { "Xresources", "xresources", "Xdefaults", "xdefaults" },
  command = "!xrdb %",
})

-- Recomplie suckless software on config edit
autocmd("BufWritePost", {
  pattern = "config.h",
  command = "!cd %:p:h ; sudo -A make install",
})

-- remember cursor pos
vim.cmd [[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
vim.cmd [[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
