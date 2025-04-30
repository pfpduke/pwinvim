-- Set <space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Custom options
vim.opt.tabstop = 4        -- A tab character looks like 4 spaces
vim.opt.shiftwidth = 4     -- Indents (like >> or <<) are 4 spaces
vim.opt.expandtab = true   -- Always insert spaces instead of real tab characters

require("config.lazy")
