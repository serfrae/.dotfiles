return {
	{
		"ibhagwan/fzf-lua",
    dependencies = { "nvim-mini/mini.icons" },
		config = function()
			require("fzf-lua").setup({
				fzf_opts = {
					["--cycle"] = "",
				},
				keymap = {
					fzf = {
						true,
						["ctrl-a"] = "select-all+accept",
						["ctrl-g"] = "",
					},
				},
				files = {
					fd_opts = "--type f --hidden --follow --exclude .git --exclude node_modules --exclude .venv --exclude .mypy_cache",
				},
				actions = {
					files = {
						true,
						["ctrl-g"] = {
							function(selected, opts)
								local o = vim.tbl_deep_extend("keep", { resume = true }, opts.__call_opts)
								opts.__call_fn(o)
							end,
						},
					},
				},
			})
			require("fzf-lua").register_ui_select()
		end,
	},
}
