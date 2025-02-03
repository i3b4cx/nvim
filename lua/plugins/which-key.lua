return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		-- which key
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{ mode = "n", "<leader>wK", "<cmd>WhichKey <CR>",                                   desc = "whichkey all keymaps" },

		{
			mode = "n",
			"<leader>wk",
			function()
				vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
			end,
			desc = "whichkey query lookup"
		},
		-- misc vim mappings
		{ mode = "n", "<Esc>",      "<cmd>noh<CR>",                                         desc = "general clear highlights" },
		{ mode = "n", "<C-s>",      "<cmd>w<CR>",                                           desc = "general save file" },
		{ mode = "n", "<C-c>",      "<cmd>%y+<CR>",                                         desc = "general copy whole file" },
		{ mode = "n", "<leader>n",  "<cmd>set nu!<CR>",                                     desc = "toggle line number" },
		{ mode = "n", "<leader>rn", "<cmd>set rnu!<CR>",                                    desc = "toggle relative number" },
		{ mode = "n", "<leader>/",  "gcc",                                                  desc = "toggle comment",               remap = true },
		{ mode = "v", "<leader>/",  "gc",                                                   desc = "toggle comment",               remap = true },
		{ mode = "i", "jk",         "<ESC>",                                                desc = "quick escape insert mode", },
		{ mode = "n", "<leader>s",  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "replace all highlights" },
		{ mode = "v", "J",          ":m '>+1<CR>gv=gv",                                     desc = "move row up" },
		{ mode = "v", "K",          ":m '<-2<CR>gv=gv",                                     desc = "move row down" },
		-- alt command entrance
		{ mode = "n", ";",          ":",                                                    desc = "CMD enter command mode" },
		-- fzf search
		{ mode = "n", "<leader>ff", "<cmd>FzfLua files<cr>",                                desc = "fzf find files" },
		{ mode = "n", "<leader>fw", "<cmd>FzfLua live_grep<cr>",                            desc = "fzf live grep" },
		{ mode = "n", "<leader>fb", "<cmd>FzfLua buffers<cr>",                              desc = "fzf find buffers" },
		{ mode = "n", "<leader>fh", "<cmd>FzfLua helptags<cr>",                             desc = "fzf help page" },
		{ mode = "n", "<leader>ma", "<cmd>FzfLua marks<cr>",                                desc = "fzf find marks" },
		{ mode = "n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>",                             desc = "fzf find oldfiles" },
		{ mode = "n", "<leader>cm", "<cmd>FzfLua git_commits<cr>",                          desc = "fzf git commits" },
		{ mode = "n", "<leader>gt", "<cmd>FzfLua git_status<cr>",                           desc = "fzf git status" },
		-- buffer navigation
		{ mode = "n", "<C-i>",      "<cmd>bnext<cr>",                                       desc = "go to next buffer" },
		{ mode = "n", "<C-o>",      "<cmd>bprev<cr>",                                       desc = "go to previous buffer" },
		{ mode = "n", "<leader>x",  "<cmd>bdelete<cr>",                                     desc = "delete buffer" },
		-- movement
		{ mode = "i", "<C-b>",      "<ESC>^i",                                              desc = "move beginning of line" },
		{ mode = "i", "<C-e>",      "<End>",                                                desc = "move end of line" },
		{ mode = "i", "<C-h>",      "<Left>",                                               desc = "move left" },
		{ mode = "i", "<C-l>",      "<Right>",                                              desc = "move right" },
		{ mode = "i", "<C-j>",      "<Down>",                                               desc = "move down" },
		{ mode = "i", "<C-k>",      "<Up>",                                                 desc = "move up" },
		-- window movement
		{ mode = "n", "<C-h>",      "<C-w>h",                                               desc = "switch window left" },
		{ mode = "n", "<C-l>",      "<C-w>l",                                               desc = "switch window right" },
		{ mode = "n", "<C-j>",      "<C-w>j",                                               desc = "switch window down" },
		{ mode = "n", "<C-k>",      "<C-w>k",                                               desc = "switch window up" },
		-- terminal
		{ mode = "t", "<C-x>",      "<C-\\><C-N>",                                          desc = "terminal escape terminal mode" },
		{
			mode = "n",
			"<leader>h",
			function()
				require("nvterm.terminal").new "horizontal"
			end,
			desc = "terminal new horizontal term"
		},
		{
			mode = "n",
			"<leader>v",
			function()
				require("nvterm.terminal").new "vertical"
			end,
			desc = "terminal new vertical term"
		},
		{
			mode = { "n", "t" },
			"<A-v>",
			function()
				require("nvterm.terminal").toggle "vertical"
			end,
			desc = "terminal toggleable vertical term"
		},
		{
			mode = { "n", "t" },
			"<A-h>",
			function()
				require("nvterm.terminal").toggle "horizontal"
			end,
			desc = "terminal toggleable horizontal term"
		},
		{
			mode = { "n", "t" },
			"<A-i>",
			function()
				require("nvterm.terminal").toggle "float"
			end,
			desc = "terminal toggle floating term"
		},
		-- plugins
		{ mode = "n", "<leader>lz", "<cmd>Lazy<cr>",    desc = "lazy plugin manager" },
		{ mode = "n", "lg",         "<cmd>LazyGit<cr>", desc = "lazy git ui" },
		{ mode = "n", "<leader>z",  "<cmd>ZenMode<cr>", desc = "zenmode ui" },
		{
			mode = "n",
			"<leader>fm",
			function()
				require("conform").format { lsp_fallback = true }
			end,
			desc = "general format file"
		},
		{ mode = "n", "<leader>ds", vim.diagnostic.setloclist,           desc = "LSP diagnostic loclist" },
		{
			mode = "n",
			"<leader>o",
			"<cmd>Workspace LeftPanelToggle<cr><cmd>Workspace RightPanelToggle<cr>",
			desc = "nvim ide toggle overlay"
		},
		{ mode = "n", "<leader>e",  "<cmd>Workspace Explorer Focus<cr>", desc = "nvim ide focus explorer" },
	},
}
