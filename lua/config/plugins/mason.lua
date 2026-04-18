return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "golangci_lint_ls",
        "basedpyright",
        "ruff",
        "lua_ls",
        "vtsls",
        "cssls",
        "clangd",
        "svelte",
      },
      automatic_enable = false,
    }
  },
}
