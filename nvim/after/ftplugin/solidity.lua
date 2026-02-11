vim.keymap.set('n', '<leader>f', function ()
    vim.cmd("!forget fmt %")
    vim.cmd("e")
end, { buffer = true })
