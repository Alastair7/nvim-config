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


      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").clangd.setup { capabilities = capabilities }
      require('lspconfig').ts_ls.setup({
        capailities = capabilities,
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
      })

      require("lspconfig").css_variables.setup({
        cmd = { "css-variables-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_markers = { "package.json", ".git" },

        settings = {
          cssVariables = {
            blacklistFolders = { "**/.cache", "**/.DS_Store", "**/.git", "**/.hg", "**/.next", "**/.svn", "**/bower_components", "**/CVS", "**/dist", "**/node_modules", "**/tests", "**/tmp" },
            lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" }
          }
        }

      })

      require("lspconfig").cssls.setup({
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

      require("lspconfig").gopls.setup({
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

      require('lspconfig').golangci_lint_ls.setup {
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

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client:supports_method('textDocument/formatting', 0) then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end
          end
        end,
      })
    end
  }
}
