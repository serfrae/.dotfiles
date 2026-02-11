vim.keymap.set("n", "<leader>f", function ()
    vim.cmd("silent !ruff format % && ruff check --fix %")
    vim.cmd("e")
end, { buffer = true })
