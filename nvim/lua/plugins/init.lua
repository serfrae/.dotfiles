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
    -- { import = "plugins.ui.indent-blankline" },
    { import = "plugins.ui.blink-indent" },
    { import = "plugins.ui.blink-pairs" },
    { import = "plugins.ui.lualine" },
    { import = "plugins.ui.noice" },
    -- { import = "plugins.ui.rainbow-delimiters" },
    --{ import = "plugins.ui.tokyonight" },

    -- lsp
    { import = "plugins.lsp.treesitter" },

    -- completions/ai
    -- { import = "plugins.completions.blink" },
    { import = "plugins.completions.copilot" },
    -- { import = "plugins.completions.luasnip" },

    -- explorers
    { import = "plugins.explorers.neotree" },
    { import = "plugins.explorers.oil" },
    -- { import = "plugins.explorers.yazi" },

    -- git
    { import = "plugins.git.gitsigns" },
    -- { import = "plugins.git.diffview" },

    -- editor
    { import = "plugins.editor.conform" },
    { import = "plugins.editor.fff" },
    { import = "plugins.editor.flash" },
    { import = "plugins.editor.fzf" },
    -- { import = "plugins.editor.grug" },
    -- { import = "plugins.editor.markview" },
    { import = "plugins.editor.surround" },
    { import = "plugins.editor.trouble" },

    -- debug
    --{ import = "plugins.dap" },
})
