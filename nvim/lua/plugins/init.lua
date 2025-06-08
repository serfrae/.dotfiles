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
    { import = "plugins.ui.indent-blankline" },
    { import = "plugins.ui.lualine" },
    { import = "plugins.ui.noice" },
    { import = "plugins.ui.rainbow-delimiters" },
    --{ import = "plugins.ui.tokyonight" },
    --{ import = "plugins.ui.smear-cursor" },

    -- lsp
    -- { import = "plugins.lsp.rustaceanvim" },
    { import = "plugins.lsp.treesitter" },
    { import = "plugins.lsp.typescript-tools" },

    -- completions/ai
    { import = "plugins.completions.blink" },
    { import = "plugins.completions.codecompanion" },
    { import = "plugins.completions.copilot" },
    { import = "plugins.completions.luasnip" },

    -- explorers
    { import = "plugins.explorers.neotree" },
    { import = "plugins.explorers.oil" },
    { import = "plugins.explorers.yazi" },
    --{ import = "plugins.explorers.nvimtree" },
    --{ import = "plugins.explorers.mini" },

    -- git
    { import = "plugins.git.gitsigns" },
    { import = "plugins.git.neogit" },

    -- editor
    { import = "plugins.editor.conform" },
    { import = "plugins.editor.flash" },
    { import = "plugins.editor.fzf" },
    { import = "plugins.editor.grug" },
    { import = "plugins.editor.snacks" },
    { import = "plugins.editor.surround" },
    { import = "plugins.editor.trouble" },

    -- debug
    --{ import = "plugins.dap" },
})
