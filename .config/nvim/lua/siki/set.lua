local set = vim.opt
local vim = vim
--vim.opt.guicursor = ""

set.nu = true
set.relativenumber = true

set.clipboard = "unnamedplus"

set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8

set.updatetime = 50
