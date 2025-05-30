print("Welcome, Alastair!")

require("config.lazy")
require('config.autocommands')

vim.opt.shiftwidth = 3
vim.opt.clipboard = "unnamedplus"
vim.o.colorcolumn = "100"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")


vim.diagnostic.config({
   virtual_text = true,
   signs = true,
   underline = true,
   update_in_insert = false,
   severity_sort = true,
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>")
