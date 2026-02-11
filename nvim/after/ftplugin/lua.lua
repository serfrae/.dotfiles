vim.keymap.set("n", "<leader>f", function()
	vim.cmd("silent !stylua %")
	vim.cmd("e")
end, { buffer = true })
