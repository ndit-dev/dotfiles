-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Neovide settings
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end

-- Default shell on Windows
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellquote = '"'
  vim.opt.shellxquote = ""
end

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false
