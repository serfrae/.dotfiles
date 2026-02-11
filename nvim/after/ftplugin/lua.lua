vim.keymap.set("n", "<leader>f", function()
	vim.cmd("!stylua %")
	vim.cmd("e")
end, { buffer = true })
