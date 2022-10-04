local set = vim.opt
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api
local g = vim.g

set.expandtab = true
set.smarttab = true
set.tabstop = 2
set.shiftwidth = 2

set.hlsearch = false
set.incsearch = true
set.ignorecase = false
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true
set.clipboard = "unnamedplus"

set.number = true
set.relativenumber = true
set.cursorline = true

set.hidden = true

g.vimwiki_list = {{
  path = "~/.local/share/nvim/vimwiki",
  syntax = "markdown",
  ext = ".md",
}}

cmd("colorscheme duskfox")

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
