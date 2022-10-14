vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require('plugins').setup()
require('config.lsp').setup()

-- Until i figure out a better way to do this.
vim.g.vimwiki_list = {{
  path = ".local/share/nvim/vimwiki",
  syntax = "markdown",
  ext = ".md",
}}
