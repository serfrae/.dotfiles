return {
	{
		"folke/flash.nvim",
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
				search = {
					enabled = true,
				},
			},
		},
		config = function(_, opts)
			require("flash").setup(opts)
			--vim.api.nvim_set_hl(0, 'FlashCursor', { fg = '#ffffff', bg = '#ff0000', bold = true })
			--vim.api.nvim_set_hl(0, 'FlashMatches', { fg = '#000000', bg = '#ffff00', bold = true })
			--vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#ffffff', bg = '#0000ff', bold = true })
			vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#24273a", bg = "#a6da95", bold = true })
			-- Change the color codes (#ff0000 and #ffffff) to your desired colors
		end,
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "R", mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        },
	},
}
