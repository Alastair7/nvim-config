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
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local function setup(server, opts)
        opts = opts or {}
        local server_capabilities = opts.capabilities or {}

        opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_capabilities)

        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end

      -- Golang configuration linter + lsp
      setup('gopls')
      setup('golangci_lint_ls')

      -- Python LSP
      setup('basedpyright')
      setup('ruff', { cmd = { "ruff", "server" }, })

      -- Lua lsp server
      setup('lua_ls', require('config.plugins.lsp.lua_ls'))

      -- Typescript / Javascript / React TSX and JSX
      setup('vtsls')

      -- CSS / SCSS
      setup('cssls')
      setup('css_variables')

      -- C / C++
      setup('clangd')

      -- SVELTE LSP
      setup('svelte', {
        filetypes = { "svelte", "typescript", "javascript" },
        capabilities = {
          workspace = {
            didChangeWatchedFiles = false
          }
        },
        settings = {
          svelte = {
            defaultScriptLanguage = "ts"
          }
        }
      })
    end
  }
}
