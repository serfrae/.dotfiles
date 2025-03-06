return {
    {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = true,
                    debounce = 50,
                    keymap = {
                        accept = '<Tab>',
                        dismiss = '<C-\'>',
                        jump_next = '<C-]>',
                        jump_prev = '<C-[>'
                    }
                }
            })
            vim.keymap.set({ 'n', 'v' }, '<leader>cp', '<cmd>Copilot panel<cr>')
        end
    }
}
