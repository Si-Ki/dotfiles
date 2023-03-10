require("siki")

local api = vim.api

 -- go to last loc when opening a buffer
  api.nvim_create_autocmd(
    "BufReadPost",
    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
  )
