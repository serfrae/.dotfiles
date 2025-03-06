return {
    {
        'neovim/nvim-lspconfig',
        opts = {
            setup = {
                rust_analayzer = function()
                    return true
                end
            }
        },
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')

            -- Go
            lspconfig.gopls.setup {}
            -- Python
            lspconfig.pylsp.setup {
                settings = {
                    pylsp = {
                        plugins = {
                            pylsp_mypy = {
                                enabled = true,
                                live_mode = true,
                            },
                            pylsp_black = {
                                enabled = true
                            },
                            pylsp_ruff = {
                                enabled = true
                            },
                            pylsp_isort = {
                                enabled = true
                            },
                            jedi = {
                                enabled = true,
                                environment = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX')
                            }
                        }
                    }
                }
            }
            -- C/C++
            lspconfig.clangd.setup {}
            -- Markdown
            lspconfig.markdown_oxide.setup {}
            -- Solidity
            lspconfig.solidity_ls_nomicfoundation.setup {}
            -- Lua
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    }
                }
            }
            -- Bash LSP
            local configs = require 'lspconfig.configs'
            if not configs.bash_lsp and vim.fn.executable('bash-language-server') == 1 then
                configs.bash_lsp = {
                    default_config = {
                        cmd = { 'bash-language-server', 'start' },
                        filetypes = { 'sh' },
                        root_dir = require('lspconfig').util.find_git_ancestor,
                        init_options = {
                            settings = {
                                args = {}
                            }
                        }
                    }
                }
            end
            if configs.bash_lsp then
                lspconfig.bash_lsp.setup {}
            end

            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.document_symbol, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })
        end
    }
}
