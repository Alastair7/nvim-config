vim.api.nvim_create_augroup('custom', { clear = true })


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = 'custom',
  callback = function()
    vim.hl.on_yank()
  end
})

-- Open a custom erminal within Neovim.
vim.api.nvim_create_autocmd('TermOpen', {
  group = 'custom',
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
