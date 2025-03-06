return {
    {
        'echasnovski/mini.files',
        version = '*',
        config = function()
            require("mini.files").setup()
            vim.keymap.set('n', '<leader>i', '<cmd>lua require("mini.files").open()<cr>')
        end
    }
}
