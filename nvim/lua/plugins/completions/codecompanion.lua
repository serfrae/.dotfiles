return {
    {
        'olimorris/codecompanion.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require("codecompanion").setup({
                adapters = {
                    anthropic = function()
                        return require("codecompanion.adapters").extend("anthropic", {
                            env = {
                                api_key = os.getenv("ANTHROPIC_API_KEY")
                            }
                        })
                    end
                },
                strategies = {
                    chat = {
                        adapter = 'anthropic',
                    },
                    inline = {
                        adapter = 'anthropic',
                    },
                    agent = {
                        adapter = 'anthropic',
                    }
                },
                display = {
                    chat = {
                        intro_message = "Enter prompt:",
                        show_header_separator = true,
                        separator = '-',
                        show_references = true,
                        show_token_acount = true,
                        start_in_insert_mode = true,
                        window = {
                            layout = "vertical",
                            width = 0.2,
                            relative = "editor",
                            border = "rounded",
                        }
                    }
                },

                vim.keymap.set({ 'n', 'v' }, '<M-\\>', '<cmd>CodeCompanion<cr>'),
                vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CodeCompanionActions<cr>'),
                vim.keymap.set({ 'n', 'v' }, '<leader>cs', '<cmd>CodeCompanionChat<cr>'),
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>CodeCompanion Add<cr>')
            })
        end
    }
}
