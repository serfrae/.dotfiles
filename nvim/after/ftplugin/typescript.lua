vim.keymap.set("n", "<leader>f", function()
    vim.cmd("!biome format --write %")
end, { buffer = true })
