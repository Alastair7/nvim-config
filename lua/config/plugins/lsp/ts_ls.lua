local M = {}

function M.setup(lspconfig, capabilities)
  lspconfig.ts_ls.setup({
    capailities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  })
end

return M;
