return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"folke/lazydev.nvim",
	},
	opts = {
		servers = {
			lua_ls = {},
			ansiblels = {},
			bashls = {},
			cssls = {},
			docker_language_server = {},
			eslint = {},
			gopls = {},
			html = {},
			helm_ls = {},
			jsonls = {},
			ts_ls = {},
			marksman = {},
			pyright = {},
			sqls = {},
			taplo = {},
			tailwindcss = {},
			terraformls = {
				filetypes = {
					"terraform",
					"terrafrom-vars",
					"hcl",
				},
			},
			yamlls = {
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
				settings = {
					yaml = {
						format = { enable = true },
						schemaStore = { enable = true },
					},
				},
			},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
