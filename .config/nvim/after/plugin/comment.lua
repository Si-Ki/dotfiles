require('Comment').setup({
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        line = '<leader>/',
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = '<leader>/',
        block = 'gb',
    },
    mappings = {
        basic = true,
        extra = true,
    },
})
