local autocmd = vim.api.nvim_create_autocmd

autocmd({ "UIEnter", "BufReadPost", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
	callback = function(args)
		local buf = args.buf
		local win = vim.api.nvim_get_current_win()
		local file = vim.api.nvim_buf_get_name(buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })

		-- Ensure UI has loaded
		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end
		if not vim.g.ui_entered then return end

		-- Check if current window is floating
		local is_floating = vim.api.nvim_win_get_config(win).relative ~= ""

		-- Early skip: floating window or special buffer
		if is_floating or buftype ~= "" then return end

		-- Delay filetype check slightly to catch dynamic set by FzfLua
		vim.defer_fn(function()
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })

			-- Skip if FzfLua
			if filetype == "FzfLua" then return end

			-- Only run once
			if vim.g.nv_filepost_done then return end
			vim.g.nv_filepost_done = true

			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(buf)
				end

				vim.cmd("silent! Workspace LeftPanelToggle")
				vim.cmd("silent! Workspace RightPanelToggle")
				vim.cmd("silent! colorscheme everforest")
			end)
		end, 20) -- 20ms delay to allow filetype to be set
	end,
})
