return {
  defaults = {
    prompt_prefix = " 󰍉 ",
    selection_caret = " ",
    file_ignore_patterns = { "node_modules", "dist", "__pycache__", "build" },
    sorting_strategy = "descending",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.6,
      },
      width = 0.9,
      height = 0.9,
    },
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
    },
  },
}
