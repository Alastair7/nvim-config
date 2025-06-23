print("Welcome, Alastair!")

require("config.lazy")
require('config.autocommands')
require('config.diagnostic')

vim.opt.shiftwidth = 3
vim.opt.clipboard = "unnamedplus"
vim.o.colorcolumn = "100"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Get List of diagnostics
vim.keymap.set("n", "grl", vim.diagnostic.setqflist)

-- Open floating window for the selected diagnostic
vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)

-- Return to the file tree
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
