-- LSP-based code-completion / snippets
return {
    {
        'saghen/blink.cmp',
        dependencies = 'L3MON4D3/LuaSnip',
        version = '*',
        opts = {
            -- https://cmp.saghen.dev/configuration/keymap
            keymap = {
                preset = 'enter',
                --["<Tab>"] = { "accept" },
            },
            -- https://cmp.saghen.dev/configuration/appearance.html
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',
            },
            -- https://cmp.saghen.dev/configuration/completion.html
            completion = {
                -- https://cmp.saghen.dev/configuration/completion.html#accept
                accept = {
                    auto_brackets = { enabled = true },
                },
                -- https://cmp.saghen.dev/configuration/completion.html#documentation
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 50,
                    treesitter_highlighting = true,
                    window = { border = "rounded" },
                },
                -- https://cmp.saghen.dev/configuration/completion.html#list
                list = {
                    selection = {
                        auto_insert = true,
                        preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                    }
                },
                -- https://cmp.saghen.dev/configuration/completion.html#menu
                menu = {
                    -- DISABLED: Don't use autocomplete in Ex-mode.
                    -- auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
                    border = "rounded",
                    draw = {
                        treesitter = { 'lsp' }
                    },
                },
                -- https://cmp.saghen.dev/configuration/reference#completion-ghost-text
                ghost_text = { enabled = false },
            },
            -- https://cmp.saghen.dev/configuration/sources.html
            -- sources = {
            --     default = { 'lsp', 'path', 'snippets', 'buffer', 'codecompanion' },
            --     providers = {
            --         codecompanion = {
            --             name = "CodeCompanion",
            --             module = "codecompanion.providers.completion.blink",
            --             enabled = true,
            --         }
            --     },
            -- },
            -- https://cmp.saghen.dev/configuration/signature.html
            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                },
            },
            -- https://cmp.saghen.dev/configuration/snippets.html#luasnip
            snippets = { preset = 'luasnip' }
        },
        opts_extend = { "sources.default" }
    },
}
