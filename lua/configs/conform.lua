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

		-- bash formatting
		bash = { "shfmt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
	},

	format_on_save = {
		lsp_fallback = false,
		timeout_ms = 500
	},
})
