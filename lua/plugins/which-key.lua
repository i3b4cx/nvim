return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	show_help = false,
	keys = {
		-- which key
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			silent = true,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{ mode = "n", "<leader>wK", "<cmd>WhichKey <CR>",                                   desc = "whichkey all keymaps" },

		{
			mode = "n",
			"<leader>wk",
			function()
				vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
			end,
			silent = true,
			desc = "whichkey query lookup"
		},
		-- misc vim mappings
		{ mode = "n", "<Esc>",      "<cmd>noh<CR>",                                         desc = "general clear highlights",      silent = true },
		{ mode = "n", "<C-s>",      "<cmd>w<CR>",                                           desc = "general save file",             silent = true },
		{ mode = "n", "<C-c>",      "<cmd>%y+<CR>",                                         desc = "general copy whole file",       silent = true },
		{ mode = "n", "<leader>n",  "<cmd>set nu!<CR>",                                     desc = "toggle line number",            silent = true },
		{ mode = "n", "<leader>rn", "<cmd>set rnu!<CR>",                                    desc = "toggle relative number",        silent = true },
		{ mode = "n", "<leader>/",  "gcc",                                                  desc = "toggle comment",                remap = true,  silent = true },
		{ mode = "v", "<leader>/",  "gc",                                                   desc = "toggle comment",                remap = true,  silent = true },
		{ mode = "i", "jk",         "<ESC>",                                                desc = "quick escape insert mode",      silent = true, },
		{ mode = "n", "<leader>s",  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "replace all highlights",        silent = true },
		{ mode = "v", "J",          ":m '>+1<CR>gv=gv",                                     desc = "move row up",                   silent = true },
		{ mode = "v", "K",          ":m '<-2<CR>gv=gv",                                     desc = "move row down",                 silent = true },
		-- window resizing
		{ mode = "n", "<D-Up>",     "<cmd>resize +2<cr>",                                   desc = "increase window height",        silent = true },
		{ mode = "n", "<D-Down>",   "<cmd>resize -2<cr>",                                   desc = "decrease window height",        silent = true },
		{ mode = "n", "<D-Right>",  "<cmd>vertical resize +2<cr>",                          desc = "increase window width",         silent = true },
		{ mode = "n", "<D-Left>",   "<cmd>vertical resize -2<cr>",                          desc = "decrease window width",         silent = true },

		{ mode = "n", "<D-k>",      "<cmd>resize +2<cr>",                                   desc = "increase window height",        silent = true },
		{ mode = "n", "<D-j>",      "<cmd>resize -2<cr>",                                   desc = "decrease window height",        silent = true },
		{ mode = "n", "<D-l>",      "<cmd>vertical resize +2<cr>",                          desc = "increase window width",         silent = true },
		{ mode = "n", "<D-h>",      "<cmd>vertical resize -2<cr>",                          desc = "decrease window width",         silent = true },
		-- alt command entrance
		{ mode = "n", ";",          ":",                                                    desc = "CMD enter command mode",        silent = true },
		-- fzf search
		{ mode = "n", "<leader>ff", "<cmd>FzfLua files<cr>",                                desc = "fzf find files",                silent = true },
		{ mode = "n", "<leader>fw", "<cmd>FzfLua live_grep<cr>",                            desc = "fzf live grep",                 silent = true },
		{ mode = "n", "<leader>fb", "<cmd>FzfLua buffers<cr>",                              desc = "fzf find buffers",              silent = true },
		{ mode = "n", "<leader>fh", "<cmd>FzfLua helptags<cr>",                             desc = "fzf help page",                 silent = true },
		{ mode = "n", "<leader>ma", "<cmd>FzfLua marks<cr>",                                desc = "fzf find marks",                silent = true },
		{ mode = "n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>",                             desc = "fzf find oldfiles",             silent = true },
		{ mode = "n", "<leader>cm", "<cmd>FzfLua git_commits<cr>",                          desc = "fzf git commits",               silent = true },
		{ mode = "n", "<leader>gt", "<cmd>FzfLua git_status<cr>",                           desc = "fzf git status",                silent = true },
		{ mode = "n", "<leader>th", "<cmd>FzfLua colorschemes<cr>",                         desc = "fzf git status",                silent = true },
		-- buffer navigation
		-- { mode = "n", "<C-i>",      "<cmd>bnext<cr>",                                       desc = "go to next buffer", silent = true },
		-- { mode = "n", "<C-o>",      "<cmd>bprev<cr>",                                       desc = "go to previous buffer", silent = true },
		-- { mode = "n", "<leader>x",  "<cmd>bdelete<cr>",                                     desc = "delete buffer", silent = true },
		-- movement
		{ mode = "i", "<C-b>",      "<ESC>^i",                                              desc = "move beginning of line",        silent = true },
		{ mode = "i", "<C-e>",      "<End>",                                                desc = "move end of line",              silent = true },
		{ mode = "i", "<C-h>",      "<Left>",                                               desc = "move left",                     silent = true },
		{ mode = "i", "<C-l>",      "<Right>",                                              desc = "move right",                    silent = true },
		{ mode = "i", "<C-j>",      "<Down>",                                               desc = "move down",                     silent = true },
		{ mode = "i", "<C-k>",      "<Up>",                                                 desc = "move up",                       silent = true },
		-- window movement
		{ mode = "n", "<C-h>",      "<C-w>h",                                               desc = "switch window left",            silent = true },
		{ mode = "n", "<C-l>",      "<C-w>l",                                               desc = "switch window right",           silent = true },
		{ mode = "n", "<C-j>",      "<C-w>j",                                               desc = "switch window down",            silent = true },
		{ mode = "n", "<C-k>",      "<C-w>k",                                               desc = "switch window up",              silent = true },
		-- terminal
		{ mode = "t", "<C-x>",      "<C-\\><C-N>",                                          desc = "terminal escape terminal mode", silent = true },
		{
			mode = "n",
			"<leader>h",
			function()
				require("nvterm.terminal").new "horizontal"
			end,
			silent = true,
			desc = "terminal new horizontal term"
		},
		{
			mode = "n",
			"<leader>v",
			function()
				require("nvterm.terminal").new "vertical"
			end,
			silent = true,
			desc = "terminal new vertical term"
		},
		{
			mode = { "n", "t" },
			"<A-v>",
			function()
				require("nvterm.terminal").toggle "vertical"
			end,
			silent = true,
			desc = "terminal toggleable vertical term"
		},
		{
			mode = { "n", "t" },
			"<A-h>",
			function()
				require("nvterm.terminal").toggle "horizontal"
			end,
			silent = true,
			desc = "terminal toggleable horizontal term"
		},
		{
			mode = { "n", "t" },
			"<A-i>",
			function()
				require("nvterm.terminal").toggle "float"
			end,
			silent = true,
			desc = "terminal toggle floating term"
		},
		-- plugins
		{ mode = "n", "<leader>ai", "<cmd>AvanteToggle<cr>", desc = "avante ai assistant", silent = true },
		{ mode = "n", "<leader>lz", "<cmd>Lazy<cr>",         desc = "lazy plugin manager", silent = true },
		{ mode = "n", "<leader>lg", "<cmd>LazyGit<cr>",      desc = "lazy git ui",         silent = true },
		{ mode = "n", "<leader>z",  "<cmd>ZenMode<cr>",      desc = "zenmode ui",          silent = true },
		{
			mode = "n",
			"<leader>fm",
			function()
				require("conform").format { lsp_fallback = true }
			end,
			silent = true,
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
