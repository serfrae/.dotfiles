return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            -- Install parsers (replaces ensure_installed)
            ts.install({
                -- primary
                "rust", "go", "typescript", "javascript", "python", "lua",
                -- web
                "html", "css", "scss", "json", "jsonc", "yaml", "toml",
                -- shell
                "bash", "fish",
                -- config/docs  
                "markdown", "markdown_inline", "vim", "vimdoc", "query",
                -- misc
                "c", "cpp", "dockerfile", "gitignore", "sql", "regex",
            })

            -- Enable highlighting (replaces highlight.enable = true)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })

            -- Enable indentation (replaces indent.enable = true)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
