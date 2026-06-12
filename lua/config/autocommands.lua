-- RANDOM UTILS AUTOCOMMANDS
vim.api.nvim_create_augroup('custom', { clear = true })


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = 'custom',
  callback = function()
    vim.hl.on_yank()
  end
})

-- Open a custom terminal within Neovim.
vim.api.nvim_create_autocmd('TermOpen', {
  group = 'custom',
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})


-- LSP RELATED AUTOCOMMANDS
local group = vim.api.nvim_create_augroup('LspFormatting', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    local buf = args.buf

    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true })
    end

    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gR", vim.lsp.buf.rename)

    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = group,
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end,
      })

      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end
    end
  end
})
