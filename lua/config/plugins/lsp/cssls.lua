local M = {}

function M.setup(lspconfig, capabilities)
  lspconfig.cssls.setup({
    capabilities = capabilities,
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    init_options = { provideFormatter = true },
    root_markers = { "package.json", ".git" },
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }
  })
end

return M
