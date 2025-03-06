return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            require("dapui").setup()
            local dap, dapui = require("dap"), require("dapui")

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.adapters.codelldb = {
                type = "server",
                executable = {
                    command = "codelldb",
                },
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    }
}
