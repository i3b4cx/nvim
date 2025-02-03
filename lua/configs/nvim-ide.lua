local bufferlist      = require('ide.components.bufferlist')
local explorer        = require('ide.components.explorer')
local outline         = require('ide.components.outline')
local callhierarchy   = require('ide.components.callhierarchy')
local timeline        = require('ide.components.timeline')
local terminal        = require('ide.components.terminal')
local terminalbrowser = require('ide.components.terminal.terminalbrowser')
local changes         = require('ide.components.changes')
local commits         = require('ide.components.commits')
local branches        = require('ide.components.branches')
local bookmarks       = require('ide.components.bookmarks')

require('ide').setup({
	icon_set = "default",
	log_level = "info",
	components = {
		global_keymaps = {
		},
	},
	panels = {
		left = "explorer",
		right = "git"
	},
	panel_groups = {
		explorer = { outline.Name, bufferlist.Name, explorer.Name, bookmarks.Name, callhierarchy.Name, terminalbrowser.Name },
		terminal = { terminal.Name },
		git = { changes.Name, commits.Name, timeline.Name, branches.Name }
	},
	workspaces = {
		auto_open = 'none',
	},
	panel_sizes = {
		left = 35,
		right = 35,
		bottom = 15
	}
})
