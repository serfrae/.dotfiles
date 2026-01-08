return {
    {
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
            vim.api.nvim_set_hl(0, 'Comment', { fg = '#89dceb', italic = true })
        end
    }
}
