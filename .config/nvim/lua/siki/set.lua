local vim = vim
local opt = vim.opt
local g = vim.g

-- vim.opt.guicursor = ""

opt.ls = 3 -- global statusline
opt.smd = false

-- Netrw settings
g.netrw_cursor = 4
g.netrw_liststyle = 3
g.netrw_list_format="%t%T%h%P%f (%s)%L"

opt.ch = 0
opt.cwh = 16
opt.nu = true
opt.rnu = true
opt.fo:remove("c")

opt.cb = "unnamedplus"
opt.cul = true

opt.ts = 2
opt.sw = 2
opt.et = true
opt.si = true
opt.sts = 2

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.undofile = true

opt.signcolumn = "yes"

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.timeoutlen = 400

opt.scrolloff = 8

opt.updatetime = 50


-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
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
