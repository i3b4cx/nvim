-- init.lua
-- Neovim config using Lazy.nvim and Folke's themes

-- Bootstrap Lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)


-- Setup Plugins
require("lazy").setup({
	require("plugins"),
})

-- Setup & Configurations
require("configs")

require("mappings")
require("options")
require("autocmds")
