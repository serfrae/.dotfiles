vim.lsp.enable({
    "rust-analyzer",
    "lua_ls",
    "gopls",
    "basedpyright",
    "ts_ls",
    "solidity_ls_nomicfoundation"
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

-- Disable the default keybinds {{{
for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
    pcall(vim.keymap.del, "n", bind)
end
-- }}}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        local keymap = vim.keymap.set
        local lsp = vim.lsp
        local opts = { silent = true }
        local function opt(desc, others)
            return vim.tbl_extend("force", opts, { desc = desc }, others or {})
        end

        keymap('n', '<leader>q', vim.diagnostic.setloclist)
        keymap("n", "gd", lsp.buf.definition, opt("Go to definition"))
        -- keymap("n", "gi", function() lsp.buf.implementation({ border = "single" }) end, opt("Go to implementation"))
        -- keymap("n", "gr", lsp.buf.references.open_float, opt("Show References"))
        keymap("n", "<leader>e", vim.diagnostic.open_float, opt("Open diagnostic in float"))
        keymap("n", "<C-j>", lsp.buf.signature_help, opts)
        keymap("n", "<Leader>a", lsp.buf.code_action, opt("Code Action"))
        keymap("n", "<Leader>r", lsp.buf.rename, opt("Rename"))
    end
})
