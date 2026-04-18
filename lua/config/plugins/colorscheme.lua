return {
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('vague').setup()

      vim.cmd [[colorscheme vague]]

      vim.api.nvim_set_hl(0, "Pmenu", {
        bg = "#1a1a1a",
        fg = "#c6c6c6",
      })

      vim.api.nvim_set_hl(0, "PmenuSel", {
        bg = "#2d2d2d",
        fg = "#ffffff",
      })

      vim.api.nvim_set_hl(0, "PmenuSbar", {
        bg = "#1a1a1a",
      })

      vim.api.nvim_set_hl(0, "PmenuThumb", {
        bg = "#444444",
      })

      vim.api.nvim_set_hl(0, "CmpItemAbbr", {
        fg = "#c6c6c6",
      })

      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {
        fg = "#89b4fa",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {
        fg = "#89b4fa",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "CmpItemKind", {
        fg = "#cba6f7",
      })
    end
  }
}
