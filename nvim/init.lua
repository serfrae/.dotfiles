-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- load core settings
require("core")
-- load plugins
require("plugins")
