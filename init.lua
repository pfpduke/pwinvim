-- Set <space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Custom options
vim.opt.tabstop = 4        -- A tab character looks like 4 spaces
vim.opt.shiftwidth = 4     -- Indents (like >> or <<) are 4 spaces
vim.opt.expandtab = true   -- Always insert spaces instead of real tab characters


-- Lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy.nvim
require("lazy").setup({
  { import = "plugins" },
})

--vim.cmd("colorscheme tokyonight")
--vim.cmd("colorscheme tokyonight")



