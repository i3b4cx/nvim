local autocmd = vim.api.nvim_create_autocmd

autocmd({ "UIEnter", "BufReadPost", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		-- UI must be ready
		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end

		-- Only act if UI is ready
		if not vim.g.ui_entered then return end

		-- Check if this is a usable buffer (named or unnamed but not special type)
		if buftype == "" then
			-- Prevent running multiple times
			if vim.g.nv_filepost_done then return end
			vim.g.nv_filepost_done = true

			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(args.buf)
				end

				vim.cmd("silent! Workspace LeftPanelToggle")
				vim.cmd("silent! Workspace RightPanelToggle")
				vim.cmd("silent! colorscheme dawnfox")
			end)
		end
	end,
})
