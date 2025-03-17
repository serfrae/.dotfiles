return {
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = true,
        ft = { 'rust' },
        config = function()
            -- local mason_registry = require("mason-registry")
            -- local codelldb = mason_registry.get_package("codelldb")
            -- local extension_path = codelldb:get_install_path() .. "/extension/"
            -- local codelldb_path = extension_path .. "adapter/codelldb"
            -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            --
            -- local dap = require('dap')
            -- local codelldb_install = require('mason-registry').get_package('codelldb'):get_install_path() .. '/codelldb'
            --
            -- dap.adapters.codelldb = {
            --     type = 'server',
            --     port = '${port}',
            --     executable = {
            --         command = codelldb_install,
            --         args = { '--port', '${port}' },
            --     },
            -- }
            --
            -- dap = {
            --     adapter = function()
            --         return require('rustaceanvim.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
            --     end,
            -- }

            vim.g.rustaceanvim = {
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    }
                },
                server = {
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<leader>k", function()
                                vim.cmd.RustLsp({ 'hover', 'actions' })
                            end,
                            { buffer = bufnr })
                        vim.keymap.set("n", "<leader>a", function()
                                vim.cmd.RustLsp('codeAction')
                            end,
                            { silent = false, buffer = bufnr }
                        )
                    end,
                    default_settings = {
                        ['rust-analyzer'] = {
                            cargo = {
                                -- Have to set to false for:
                                -- https://github.com/coral-xyz/anchor/issues/3042
                                allFeatures = false,
                            },
                            imports = {
                                group = {
                                    enable = true,
                                },
                            },
                            completion = {
                                postfix = {
                                    enable = false,
                                },
                            },
                            checkOnSave = {
                                command = 'clippy',
                            },
                        },
                    }
                }
            }
        end
    }
}
