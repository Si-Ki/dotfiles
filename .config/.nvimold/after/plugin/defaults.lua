-- SETTINGS
local set = vim.opt
local cmd = vim.cmd
local g = vim.g

set.clipboard = ""
set.expandtab = true
set.smarttab = true
set.tabstop = 2
set.shiftwidth = 2
set.timeoutlen = 300

set.hlsearch = false
set.incsearch = true
set.ignorecase = false

set.splitbelow = true
set.splitright = true
set.wrap = true
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true

set.number = true
set.relativenumber = true
set.cursorline = true

set.hidden = true

g.vimwiki_list = {{
  path = "~/.local/share/nvim/vimwiki",
  syntax = "markdown",
  ext = ".md",
}}

require("catppuccin").setup({
  transparent_background = false,})

g.catppuccin_flavour = "mocha"
cmd("colorscheme catppuccin")
