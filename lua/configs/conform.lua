local options = {
  default_format_opts = {
    timeout_ms = 3000,
    async = false,
    quiet = false,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier", stop_after_first = true },
    python = { "isort", "black" },
    json = { "prettier" },
    yaml = { "prettier" },
  },
  formatters = {
    black = {
      prepend_args = { "--fast", "--line-length=120" },
    },
    isort = {
      prepend_args = { "--style=black" },
    },
    -- prettier = {}
  },
}

return options
