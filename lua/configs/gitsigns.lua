return {
  on_attach = function(bufnr)
    local gitsigns = require "gitsigns"
    vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { buffer = bufnr })
  end,
}
