vim.keymap.set('n', '<leader>f', function ()
    vim.cmd("silent !forge fmt %")
    vim.cmd("e")
end, { buffer = true })
