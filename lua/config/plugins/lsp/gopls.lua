local M = {}

function M.setup(lspconfig, capabilities)
  lspconfig.gopls.setup({
    capabilities = capabilities,
    settings = {
      gopls = {
        hints = {
          assignVariableTypes = false,
          compositeLiteralFields = false,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      }
    }
  })
end

return M
