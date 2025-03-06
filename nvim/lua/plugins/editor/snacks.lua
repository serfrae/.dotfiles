return {
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            input = {}
            --         picker = { enabled = true },
            --         explorer = { enabled = true },
        },
        --     keys = {
        --         { "<leader>`",  function() Snacks.picker() end,                       desc = "All Pickers" },
        --         { "<leader>ss", function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
        --         { "<leader>o",  function() Snacks.picker.files() end,                 desc = "Find Files" },
        --         { "<leader>b",  function() Snacks.picker.buffers() end,               desc = "Buffers" },
        --         { "<leader>g",  function() Snacks.picker.grep() end,                  desc = "Grep" },
        --         { "<leader>x",  function() Snacks.explorer() end,                     desc = "File explorer" },
        --         -- Search
        --         { "<leader>:",  function() Snacks.picker.command_history() end,       desc = "Command History" },
        --         { '<leader>s"', function() Snacks.picker.registers() end,             desc = "Registers" },
        --         { '<leader>s/', function() Snacks.picker.search_history() end,        desc = "Search History" },
        --         { "<leader>sc", function() Snacks.picker.command_history() end,       desc = "Command History" },
        --         { "<leader>sd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
        --         { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
        --         { "<leader>sj", function() Snacks.picker.jumps() end,                 desc = "Jumps" },
        --         { "<leader>sl", function() Snacks.picker.loclist() end,               desc = "Location List" },
        --         { "<leader>sm", function() Snacks.picker.marks() end,                 desc = "Marks" },
        --         { "<leader>sq", function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
        --         { "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo History" },
        --         -- LSP
        --         { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
        --         { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
        --         { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = "References" },
        --         { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
        --         { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        --         { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        --         { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        --     },
    }
}
