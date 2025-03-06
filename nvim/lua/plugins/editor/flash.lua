return {
    {
        'folke/flash.nvim',
        event = "VeryLazy",
        ---@diagnostic disable-next-line: undefined-doc-name
        ---@type Flash.Config,
        opts = {
            highlight = {
                -- The backdrop is a lot of visual noise
                backdrop = false,
                matches = true,
            },
            modes = {
                char = {
                    highlight = {
                        backdrop = false,
                    },
                },
            },
        },
        config = function(_, opts)
            require('flash').setup(opts)
            --vim.api.nvim_set_hl(0, 'FlashCursor', { fg = '#ffffff', bg = '#ff0000', bold = true })
            --vim.api.nvim_set_hl(0, 'FlashMatches', { fg = '#000000', bg = '#ffff00', bold = true })
            --vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#ffffff', bg = '#0000ff', bold = true })
            vim.api.nvim_set_hl(0, 'FlashLabel', { link = 'lualine_a_insert', bold = true })
            -- Change the color codes (#ff0000 and #ffffff) to your desired colors
        end,
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("nvim.lua.plugins.editor.flash").jump() end,              desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("nvim.lua.plugins.editor.flash").treesitter() end,        desc = "Flash Treesitter" },
            { "R", mode = { "n", "o", "x" }, function() require("nvim.lua.plugins.editor.flash").treesitter_search() end, desc = "Treesitter Search" },
            { "r", mode = "o",               function() require("nvim.lua.plugins.editor.flash").remote() end,            desc = "Remote Flash" },
        },
    }
}
