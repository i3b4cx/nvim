-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "vim", "vimdoc", "html", "css", "typescript", "cpp", "lua", "javascript" },
	highlight = { enable = true },
	indent = { enable = true },
})
