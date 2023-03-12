require('Comment').setup({
    padding = true,
    sticky = true,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        line = '<leader>/',
        block = '<leader>c',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = '<leader>/',
        block = '<leader>c',
    },
    mappings = {
        basic = true,
        extra = true,
    },
})
