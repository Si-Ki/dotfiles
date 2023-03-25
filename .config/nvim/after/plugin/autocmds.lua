local autocmd = vim.api.nvim_create_autocmd

-- go to last loc when opening a buffer
autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

autocmd("FileType", { command = [[setlocal formatoptions-=cro]] })

autocmd("BufWritePost", {
  pattern = "dunstrc",
  command = "!pidof dunst||killall dunst; setsid -f dunst & dunstify 'test' 'fuck you'",
})

autocmd("BufWritePost", {
  pattern = { "config.jsonc", "style.css" },
  command = "!killall waybar && setsid -f waybar"
})

autocmd("BufWritePost", {
  pattern = { "bm-dirs", "bm-files" },
  command = "!shortcuts",
})
