require("siki")
require('impatient')

local api = vim.api

-- go to last loc when opening a buffering
api.nvim_create_autocmd( "BufReadPost", { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] })

api.nvim_create_autocmd( "FileType", { command = [[setlocal formatoptions-=cro]] } )
