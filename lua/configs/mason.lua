require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pylsp", "html", "cssls", "ts_ls", "clangd" }
})
