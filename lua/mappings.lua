require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

-- disable predefined mappings
nomap("i", "<C-b>")
nomap("i", "<C-e>")
nomap("i", "<C-h>")
nomap("i", "<C-l>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")
nomap("n", "<C-h>")
nomap("n", "<C-l>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<Esc>")
nomap("n", "<C-s>")
nomap("n", "<C-c>")
nomap("n", "<leader>n")
nomap("n", "<leader>rn")
nomap("n", "<leader>ch")
-- nvimtree
nomap("n", "<leader>e")
-- telescope
-- nomap("n", "<leader>fw")
nomap("n", "<leader>fb")
nomap("n", "<leader>fh")
nomap("n", "<leader>ma")
nomap("n", "<leader>fo")
nomap("n", "<leader>fz")
nomap("n", "<leader>ff")
nomap("n", "<leader>fa")
nomap("n", "<leader>cm") nomap("n", "<leader>gt") nomap("n", "<leader>pt")
-- whichkey
nomap("n", "<leader>wK")
nomap("n", "<leader>wk")
-- commnet
nomap("n", "<leader>/")
nomap("v", "<leader>/")
-- nvterm
-- nomap("n", "<A-i>")
-- nomap("n", "<A-h>")
-- nomap("n", "<A-v>")
-- nomap("n", "<leader>h")
-- nomap("n", "<leader>v")
-- nomap("t", "<A-i>")
-- nomap("t", "<A-h>")
-- nomap("t", "<A-v>")
-- gitsigns
-- nomap("n", "<leader>rh")
-- nomap("n", "<leader>td")
-- tabufline
nomap("n", "<leader>x")
-- conform
nomap({"n", "x"}, "<leader>fm")

-- common
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>w", "<cmd> w <cr>")
-- map("n", "<leader>q", "<cmd> q <cr>")
map("n", "<leader>l", "<cmd> Lazy <cr>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "J", ":move '>+1<cr>gv=gv")
map("v", "K", ":move '<-2<cr>gv=gv")
map("v", "<BS>", '"_d')
map("n", "<leader>ch", "<cmd>noh<CR>")

-- tabufline
map("n", "<leader>q", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- telescope
map("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map("n", "<leader>fh", "<cmd>Telescope find_files hidden=true<CR>", { desc = "telescope find files with hidden" })
map("n", "<leader>fi", "<cmd>Telescope find_files no_ignore=true<CR>", { desc = "telescope find files with ignore" })
map("n", "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", { desc = "telescope find all files" })

-- comment
map("n", "\\\\", "gcc", { desc = "toggle comment", remap = true })
map("v", "\\\\", "gc", { desc = "toggle comment", remap = true })

-- conform
map({ "n", "x" }, "<leader>m", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })
