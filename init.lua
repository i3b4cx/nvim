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

-- Patch for lazygit floating window close issue
local api = vim.api
local orig_close_win = api.nvim_win_close

api.nvim_win_close = function(win, force)
	if api.nvim_win_is_valid(win) then
		return orig_close_win(win, force)
	end
	-- suppress invalid win id error
end
