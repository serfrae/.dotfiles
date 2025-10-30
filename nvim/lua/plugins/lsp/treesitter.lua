return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = "all",
                ignore_install = { "ipkg" },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                additional_vim_regex_highlighting = false,
            }
        end
    }
}
