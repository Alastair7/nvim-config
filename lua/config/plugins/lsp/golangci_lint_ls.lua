local M = {}

function M.setup(lspconfig, capabilities)
  lspconfig.golangci_lint_ls.setup {
    capabilities = capabilities,
    cmd = { 'golangci-lint-langserver' },
    init_options = {
      command = {
        "golangci-lint",
        "run",
        "--out-format=json",
      },
    },
    filetypes = { 'go' },
    root_dir = require('lspconfig').util.root_pattern('.git', 'go.mod', 'Makefile'),
  }
end

return M
