local ts_filetypes = require('config.treesitter.filetypes')

local max_file_size = 300 * 1024
local max_lines = 5000

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype

    if not ts_filetypes[filetype] then
      return
    end

    if vim.b[args.buf].ts_started then
      return
    end

    local file = vim.api.nvim_buf_get_name(args.buf)
    if file == "" then
      return
    end

    local ok, stats = pcall(vim.uv.fs_stat, file)

    if (ok and stats and stats.size > max_file_size)
        or vim.api.nvim_buf_line_count(args.buf) > max_lines then
      return
    end

    vim.b[args.buf].ts_started = true

    pcall(vim.treesitter.start, args.buf)
  end
})
