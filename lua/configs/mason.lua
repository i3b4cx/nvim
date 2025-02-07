require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "eslint" }
})
require("mason-nvim-dap").setup({
	ensure_installed = { "python", "cppdbg", "delve", "chrome", "firefox", "js", "bash", "javadbg" }
})
