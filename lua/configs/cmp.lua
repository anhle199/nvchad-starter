local cmp = require "cmp"

local options = {
  mapping = {
    ["<C-p>"] = cmp.config.disable,
    ["<C-n>"] = cmp.config.disable,
    ["<C-f>"] = cmp.config.disable,
    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return vim.tbl_deep_extend("force", options, require "nvchad.configs.cmp")
