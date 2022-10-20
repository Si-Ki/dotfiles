local autocmd = vim.api.nvim_create_autocmd
-- AUTOCMDS

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

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- remember cursor pos
vim.cmd [[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
vim.cmd [[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
