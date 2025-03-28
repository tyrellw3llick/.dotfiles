-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.guicursor = "i:block-blinkwait0-blinkon100-blinkoff100"

-- Avoid conflicts between biome and prettier
vim.g.lazyvim_prettier_needs_config = true
