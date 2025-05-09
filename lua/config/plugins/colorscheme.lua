return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      on_highlights = function(hl, _)
        hl.LineNr = { fg = "#ffffff", bold = true }
        hl.LineNrBelow = { fg = "#dddddd" }
        hl.LineNrAbove = { fg = "#dddddd" }
      end

    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme "tokyonight"
    end
  }
}
