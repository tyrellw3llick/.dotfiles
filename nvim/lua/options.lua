vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.wrap = false

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

vim.opt.termguicolors = true

opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

-- Undo persistance
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(vim.o.undodir, "p")
