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

      -- Golang configuration linter + lsp
      vim.lsp.config('gopls', { capabilities = capabilities })
      vim.lsp.config('golangci_lint_ls', { capabilities = capabilities })


      vim.lsp.enable('gopls', true)
      vim.lsp.enable('golangci_lint_ls', true)

      -- Python LSP
      vim.lsp.config('basedpyright', { capabilities = capabilities })
      vim.lsp.enable("basedpyright", true)



      vim.lsp.config('ruff', {
        cmd = { "ruff", "server" },
        capabilities = capabilities
      })
      vim.lsp.enable('ruff')

      -- Lua lsp server
      vim.lsp.config('lua_ls', { capabilities = require('blink.cmp').get_lsp_capabilities() })
      vim.lsp.enable('lua_ls', true)

      -- Typescript / Javascript / React TSX and JSX
      vim.lsp.config('ts_ls', { capabilities = require('blink.cmp').get_lsp_capabilities() })
      vim.lsp.enable('ts_ls', true)

      -- CSS / SCSS

      vim.lsp.config('cssls', { capabilities = require('blink.cmp').get_lsp_capabilities() })
      vim.lsp.config('css_variables', { capabilities = require('blink.cmp').get_lsp_capabilities() })

      vim.lsp.enable('cssls', true)
      vim.lsp.enable('css_variables', true)

      -- C / C++
      vim.lsp.config('clangd', { capabilities = require('blink.cmp').get_lsp_capabilities() })
      vim.lsp.enable('clangd', true)

      -- SVELTE LSP
      vim.lsp.config('svelte', { capabilities = require('blink.cmp').get_lsp_capabilities() })
      vim.lsp.enable('svelte')
    end
  }
}
