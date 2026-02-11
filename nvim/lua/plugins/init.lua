local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- ui
    { import = "plugins.ui.catppuccin" },
    { import = "plugins.ui.mini-statusline" },

    -- lsp
    { import = "plugins.lsp.treesitter" },

    -- completions/ai
    { import = "plugins.completions.blink" },
    { import = "plugins.completions.copilot" },
    { import = "plugins.completions.luasnip" },

    -- editor
    { import = "plugins.editor.flash" },
    { import = "plugins.editor.fzf" },
    { import = "plugins.editor.surround" },
    { import = "plugins.editor.trouble" },
})
