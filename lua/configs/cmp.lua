-- LSP Config
local lspconfig = require "lspconfig"
local servers = { "pylsp", "html", "cssls", "ts_ls", "clangd", "bashls", "yamlls" }
local nvlsp = require("configs.lspconfig")
-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	}
end
lspconfig['lua_ls'].setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	},
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
}
-- Completion
local cmp_kinds = {
	Text = ' ',
	Method = ' ',
	Function = ' ',
	Constructor = ' ',
	Field = ' ',
	Variable = ' ',
	Class = ' ',
	Interface = ' ',
	Module = ' ',
	Property = ' ',
	Unit = ' ',
	Value = ' ',
	Enum = ' ',
	Keyword = ' ',
	Snippet = ' ',
	Color = ' ',
	File = ' ',
	Reference = ' ',
	Folder = ' ',
	EnumMember = ' ',
	Constant = ' ',
	Struct = ' ',
	Event = ' ',
	Operator = ' ',
	TypeParameter = ' ',
}
local cmp = require("cmp")
cmp.setup({
	window = {
		completion = cmp.config.window.bordered {
			border = 'double',
			winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
		},
		documentation = cmp.config.window.bordered {
			border = 'double',
			winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
		},
	},
	formatting = {
		fields = { 'kind', 'abbr' },
		format = function(_, vim_item)
			vim_item.kind = cmp_kinds[vim_item.kind] or ''
			vim_item.menu = ''
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}),
})
