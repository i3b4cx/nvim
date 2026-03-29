return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = require("configs.snacks.dashboard"),
		bigfile = { enabled = false },
		indent = { enabled = true },
		input = { enabled = false },
		picker = { enabled = false },
		notifier = { enabled = true },
		quickfile = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		github = { enabled = true },
		zen = { enabled = false },
	},
}
