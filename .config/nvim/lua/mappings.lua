local map = vim.api.nvim_set_keymap
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>n', ':NvimTreeFocus<CR>', opts)

map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

map('n', '<S-s>', ':%s//g<Left><Left>', {}) -- Replace all
map('n', '<leader>m', ':Mason<CR>', {}) -- Replace all

map('n', '<leader>ss', '<cmd> execute \'silent! write !sudo -A tee % >/dev/null\' <bar> edit! <CR>\'', opts) -- Saving files
map('n', '<C-s>', ':w<CR>:luafile %<CR>', {})

map('n', '<leader>s', '<cmd> !clear && shellcheck -x %<CR>', opts)

-- Telescope binds
local builtin = require('telescope.builtin')
set('n', '<leader>tt', builtin.colorscheme, {})
set('n', '<leader>ff', builtin.find_files, {})
set('n', '<leader>fw', builtin.live_grep, {})
set('n', '<leader>fb', builtin.buffers, {})
set('n', '<leader>fh', builtin.help_tags, {})
-- git stuff
set('n', '<leader>cm', '<cmd> Telescope git_commits <CR>', {})
set('n', '<leader>gt', '<cmd> Telescope git_status <CR>', {})

-- Barbar binds
-- Move to previous/next
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
