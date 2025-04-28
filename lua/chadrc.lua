-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "radium",
  theme_toggle = { "radium", "github_light" },

  hl_add = {
    NvimTreeOpenedFolderName = {
      fg = "green",
      bold = true,
    },
  },
  hl_override = {
    Comment = {
      italic = true,
    },
  },
}

M.ui = {
  telescope = {
    style = "bordered",
  },
  statusline = {
    theme = "minimal",
    separator_style = "block",
  },
  cmp = {
    icons_left = true,
  },
}

M.nvdash = {
  load_on_startup = false,

  header = {
    "                                                                          ",
    "██╗  ██╗ ██████╗  █████╗ ███╗   ██╗ ██████╗      █████╗ ███╗   ██╗██╗  ██╗",
    "██║  ██║██╔═══██╗██╔══██╗████╗  ██║██╔════╝     ██╔══██╗████╗  ██║██║  ██║",
    "███████║██║   ██║███████║██╔██╗ ██║██║  ███╗    ███████║██╔██╗ ██║███████║",
    "██╔══██║██║   ██║██╔══██║██║╚██╗██║██║   ██║    ██╔══██║██║╚██╗██║██╔══██║",
    "██║  ██║╚██████╔╝██║  ██║██║ ╚████║╚██████╔╝    ██║  ██║██║ ╚████║██║  ██║",
    "╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝",
    "                                                                          ",
  },

  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.mason = {
  pkgs = {
    -- lua dev
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    -- "typescript-language-server",
    "vtsls",
    "prettier",

    -- python dev
    "pyright",
    "black",
    "isort",

    -- others
    "json-lsp",
  },
}

return M
