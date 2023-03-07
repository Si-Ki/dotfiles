local set = vim.keymap.set

local builtin = require('telescope.builtin')
set('n', '<leader>ff', builtin.find_files, {})
set('n', '<leader>fw', builtin.live_grep, {})
set('n', '<leader>fb', builtin.buffers, {})
