return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"folke/lazydev.nvim",
	},
	init = function()
		local servers = {
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
		}
		for server, config in pairs(servers) do
			vim.lsp.enable(server)
      vim.lsp.config(server, config)
		end
	end,
}
