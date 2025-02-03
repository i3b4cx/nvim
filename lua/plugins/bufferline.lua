return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				offsets = {
					{
						filetype = "filetree",
						text = "",
						text_align = "left",
						separator = true,
					},
				},
			},
		})
	end,
}
