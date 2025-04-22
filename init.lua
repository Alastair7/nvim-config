print("Advent of Neovim")

require("config.lazy")

vim.opt.shiftwidth = 3
vim.opt.clipboard = "unnamedplus"
vim.o.colorcolumn = "100"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
   desc = 'Highlight when yanking (copying) text',
   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
   callback = function()
      vim.highlight.on_yank()
   end
})

vim.api.nvim_create_autocmd('TermOpen', {
   group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
   callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
   end,
})

vim.diagnostic.config({
   virtual_text = true,
   signs = true,
   underline = true,
   update_in_insert = false,
   severity_sort = true,
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>")
