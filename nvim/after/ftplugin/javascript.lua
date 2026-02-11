vim.keymap.set("n", "<leader>f", function()
    vim.cmd("silent !biome format --write %")
end, { buffer = true })
