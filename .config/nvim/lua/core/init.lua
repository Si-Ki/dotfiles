-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- commands
vim.cmd "silent! command! NvChadUpdate lua require('nvchad').update_nvchad()"
vim.cmd "silent! command! NvChadSnapshotCreate lua require('nvchad').snap_create()"
vim.cmd "silent! command! NvChadSnapshotDelete lua require('nvchad').snap_delete()"
vim.cmd "silent! command! NvChadSnapshotCheckout lua require('nvchad').snap_checkout()"


-- autocmds
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

vim.cmd [[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
vim.cmd [[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

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
  command = "!cd %:p:h ; sudo make install",
})

-- Reload dunst and send test notif
autocmd("BufWritePost", {
  pattern = "dunstrc",
  command = "!killall dunst; setsid -f dunst & dunstify 'test' 'fuck you'",
})

-- wrap the PackerSync command to warn people before using it in NvChadSnapshots
autocmd("VimEnter", {
  callback = function()
    vim.cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('plugins') require('core.utils').packer_sync(<f-args>)"
  end,
})
