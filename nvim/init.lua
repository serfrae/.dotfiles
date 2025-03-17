-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- load core settings
require("core")
-- load plugins
require("plugins")
