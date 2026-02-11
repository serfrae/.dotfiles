return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")

			ls.config.setup({
				keep_roots = true,
				link_roots = true,
				link_children = true,
				exit_roots = false,

				loaders_store_source = true,
				update_events = { "TextChangedI" },
				enable_autosnippets = true,
				region_check_events = { "CursorHold", "InsertLeave" },
				delete_check_events = "TextChanged, InsertEnter, CursorMovedI",
				store_selection_keys = "<Tab>",
				ft_func = function()
					local fts = require("luasnip.extras.filetype_functions").from_pos_or_filetype()
					-- should be possible to extend `all`-filetype.
					table.insert(fts, "all")
					local effective_fts = {}

					local buflocal_extend = vim.b.luasnip_ft_extend
					if buflocal_extend then
						for _, ft in ipairs(fts) do
							vim.list_extend(effective_fts, buflocal_extend[ft] or {})
						end
						vim.list_extend(effective_fts, fts)
					else
						effective_fts = fts
					end

					return effective_fts
				end,
			})

			ls.filetype_extend("*", { "all" })
			ls.filetype_extend("rust", { "rust" })
			ls.filetype_extend("typescript", { "typescript" })

			vim.keymap.set({ "i", "s" }, "<C-K>", ls.expand, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				ls.jump(-1)
			end, { silent = true })

			require("luasnip.loaders.from_lua").load({ paths = "~/.dotfiles/snippets" })
		end,
	},
}
