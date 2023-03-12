local set = vim.opt

-- vim.opt.guicursor = ""

set.laststatus = 3 -- global statusline
set.showmode = false

set.nu = true
set.relativenumber = true
set.formatoptions:remove("c")

set.clipboard = "unnamedplus"

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smartindent = true
set.softtabstop = 2

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.signcolumn = "yes"

set.hlsearch = false
set.incsearch = true

set.termguicolors = true
set.timeoutlen = 400

set.scrolloff = 8

set.updatetime = 50


-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
