return {
    {
        'nvim-mini/mini.surround',
        version = false,
        opts = {
            mappings = {
                add = 'ys',    -- Add surrounding in Normal and Visual modes
                delete = 'ds', -- Delete surrounding
                find = 'gsf',  -- Find surrounding (to the right)
                find_left = 'gsF', -- Find surrounding (to the left)
                highlight = 'gsh', -- Highlight surrounding
                replace = 'cs', -- Replace surrounding
            },
        },
    }
}
