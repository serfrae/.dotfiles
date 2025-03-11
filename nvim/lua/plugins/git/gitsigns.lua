return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function(bufnr)
                local gs = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gs.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gs.nav_hunk('prev')
                    end
                end)

                -- Actions
                map('n', '<leader>hs', gs.stage_hunk)
                map('n', '<leader>hr', gs.reset_hunk)

                map('v', '<leader>hs', function()
                    gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                map('v', '<leader>hr', function()
                    gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                map('n', '<leader>hS', gs.stage_buffer)
                map('n', '<leader>hR', gs.reset_buffer)
                map('n', '<leader>hp', gs.preview_hunk)
                map('n', '<leader>hi', gs.preview_hunk_inline)

                map('n', '<leader>hb', function()
                    gs.blame_line({ full = true })
                end)

                map('n', '<leader>hd', gs.diffthis)

                map('n', '<leader>hD', function()
                    gs.diffthis('~')
                end)

                map('n', '<leader>hQ', function() gs.setqflist('all') end)
                map('n', '<leader>hq', gs.setqflist)

                -- Toggles
                map('n', '<leader>hc', gs.toggle_current_line_blame)
                map('n', '<leader>hx', gs.toggle_deleted)
                map('n', '<leader>hw', gs.toggle_word_diff)

                -- Text object
                map({ 'o', 'x' }, 'ih', gs.select_hunk)
            end,
        }
    }
}
