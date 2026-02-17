return {
	"stevearc/conform.nvim",
	init = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				vim.keymap.set({ "n", "x" }, "grf", function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					})
				end, { buffer = event.buf, desc = "Format buffer or range" })
			end,
		})
	end,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
		},
	},
}
