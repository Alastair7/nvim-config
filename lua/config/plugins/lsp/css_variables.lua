local M = {}

function M.setup(lspconfig, capabilities)
  lspconfig.css_variables.setup({
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
end

return M
