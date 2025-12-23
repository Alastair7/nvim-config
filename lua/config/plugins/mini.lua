return {
  {
    'nvim-mini/mini.nvim',
    enabled = true,
    config = function()
      local statusline = require 'mini.statusline'
      require('mini.git').setup()

      statusline.setup { use_icons = true }
    end
  }
}
