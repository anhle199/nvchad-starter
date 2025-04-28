return {
  -- overrides
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "stevearc/conform.nvim", opts = require "configs.conform" },
  { "nvim-telescope/telescope.nvim", opts = require "configs.telescope" },
  { "nvim-treesitter/nvim-treesitter", opts = require "configs.treesitter" },
  { "lukas-reineke/indent-blankline.nvim", opts = require "configs.indentblankline" },
  { "nvim-tree/nvim-tree.lua", opts = require "configs.nvimtree" },
  { "hrsh7th/nvim-cmp", opts = require "configs.cmp" },
  { "lewis6991/gitsigns.nvim", opts = require "configs.gitsigns" },

  -- disabled
  { "folke/which-key.nvim", enabled = false },
  { "NvChad/nvterm", enabled = false },
  { "NvChad/nvim-colorizer.lua", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "nvzone/minty", enabled = false },
}
