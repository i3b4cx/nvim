require("conform").setup({
	formatters_by_ft = {
		-- lua formatting
		lua = { "stylua" },

		-- c/c++ formatting, prefer clang-format explicitly
		c = { "clang_format" },
		cpp = { "clang_format" },

		-- meson formatting
		meson = { "meson_format" },
		["meson.build"] = { "meson_format" },
		build = { "meson_format" },

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

	formatters = {
		-- clang-format for C/C++
		clang_format = {
			command = "clang-format",
			args = {},
			stdin = true,
		},

		-- meson format
		meson_format = {
			command = "meson",
			args = { "format", "-" },
			stdin = true,
		},
	},

	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
})
