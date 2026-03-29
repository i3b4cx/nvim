local has_devicons, devicons = pcall(require, "nvim-web-devicons")

local static = {}

local custom_icons = {
	mode = "",
	git_branch = "",
	error = " ",
	warn = " ",
	info = " ",
	hint = " ",
	added = " ",
	modified = "󰝤 ",
	modified_simple = "~ ",
	removed = " ",
	lock = "",
	touched = "●"
}

local get_ftype_icon = function()
	local full_filename = vim.api.nvim_buf_get_name(0)
	local filename = vim.fn.fnamemodify(full_filename, ":t")
	local extension = vim.fn.fnamemodify(filename, ":e")
	static.ftype_icon, static.ftype_icon_color = devicons.get_icon_color(filename, extension, { default = true })
	return static.ftype_icon and static.ftype_icon .. ""
end

local condition = {
	is_buf_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
	is_git_repo = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		component_separators = "",
		section_separators = "",
		always_divide_middle = true,
		theme = {
			normal = { c = { bg = "Normal", gui = "bold" } },
			inactive = { c = {} },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = { "location" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	-- tabline = {
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {}
	-- }
}

local status_c = function(component) table.insert(config.sections.lualine_c, component) end
local status_x = function(component) table.insert(config.sections.lualine_x, component) end

status_c({ function() return "| " end, color = {}, padding = { left = 0 } })

status_c({
	-- Colored mode icon
	function() return custom_icons.mode end,
	color = function() return {} end,
	padding = { right = 1 },
})

status_c({
	-- File type icon via 'nvim-web-devicons'
	function() if has_devicons then return get_ftype_icon() end end,
	cond = condition.is_buf_empty,
	color = { fg = static.ftype_icon_color },
	padding = { left = 1, right = 0 }
})

status_c({
	"filename",
	cond = condition.is_buf_empty,
	path = 0,
	color = {},
	symbols = {
		modified = custom_icons.touched,
		readonly = custom_icons.lock,
		unnamed = "[No Name]",
		newfile = "[New]"
	}
})

status_c({ function() return "%=" end })

status_x({
	"diff",
	cond = condition.is_git_repo,
	source = function()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
		end
	end,
	symbols = {
		added = custom_icons.added,
		modified = custom_icons.modified_simple,
		removed = custom_icons.removed
	},
	colored = true,
	diff_color = {
		added = {},
		modified = {},
		removed = {}
	}
})

status_x({
	"diagnostics",
	sources = { "nvim_lsp", "nvim_diagnostic" },
	symbols = {
		error = custom_icons.error,
		warn = custom_icons.warn,
		info = custom_icons.info,
		hint = custom_icons.hint
	},
	diagnostics_color = {
		error = {},
		warn = {},
		info = {},
		hint = {}
	}
})

status_x({ "branch", icon = custom_icons.git_branch, color = {} })
status_x({ function() return " |" end, color = {}, padding = { right = 0 } })

return config
