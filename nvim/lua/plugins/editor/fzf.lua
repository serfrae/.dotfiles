return {
    {
        'ibhagwan/fzf-lua',
        config = function()
            require('fzf-lua').setup {
                fzf_opts = {
                    ['--cycle'] = ''
                },
                keymap = {
                    fzf = {
                        ["ctrl-a"] = "select-all+accept",
                    }
                },
                files = {
                    fd_opts = "--type f --hidden --follow --exclude .git --exclude node_modules --exclude .venv --exclude .mypy_cache"
                },
            }
            require('fzf-lua').register_ui_select()

            -- local actions = require("trouble.sources.fzf").actions
            -- local config = require("fzf-lua.config")
            -- config.defaults.actions.files["ctrl-s"] = actions.open
        end,
    }
}
