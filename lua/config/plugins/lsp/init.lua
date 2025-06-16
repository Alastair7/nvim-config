return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true }
    },
    dependencies = {
      'saghen/blink.cmp',
      {
        {
          "folke/lazydev.nvim",
          ft = "lua", -- only load on lua files
          opts = {
            library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
          },
        }
      }
    },
    config = function()
      local lspconfig = require('lspconfig')
      local blink = require('blink-cmp')
      local capabilities = blink.get_lsp_capabilities()

      require("config.plugins.lsp.lua_ls").setup(lspconfig, capabilities)
      require("config.plugins.lsp.clangd").setup(lspconfig, capabilities)
      require("config.plugins.lsp.ts_ls").setup(lspconfig, capabilities)
      require("config.plugins.lsp.css_variables").setup(lspconfig, capabilities)
      require("config.plugins.lsp.cssls").setup(lspconfig, capabilities)
      require("config.plugins.lsp.gopls").setup(lspconfig, capabilities)
      require("config.plugins.lsp.golangci_lint_ls").setup(lspconfig, capabilities)
      require("config.plugins.lsp.pyright").setup(lspconfig, capabilities)
    end
  }
}
