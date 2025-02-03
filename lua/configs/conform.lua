require("conform").setup({
	formatters_by_ft = {
		-- lua formatting
		lua = { "stylua" },

		-- c/c++ formatting
		c = { "clang_format" },
		cpp = { "clang_format" },

		-- web development formatting
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		yaml = { "prettier" },
	},

	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500
	},
})
