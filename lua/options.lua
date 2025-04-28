require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
local o = vim.o

o.mouse = ""
o.undofile = false
o.cursorlineopt = 'both'

-- Backup/swap file
opt.backup = false -- creates a backup file
opt.writebackup = true -- creates a backup file while it is being edited. The backup is removed after the file was successfully written
opt.swapfile = true
opt.confirm = true -- confirm to save changes before exiting modified buffer

-- Lines
opt.wrap = true
opt.linebreak = true
opt.backspace = { "start", "eol", "indent" } -- enable 'Backspace' key in insert mode

o.numberwidth = 4
