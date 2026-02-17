return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	keys = {
		{
			"<leader>m",
			function()
				require("render-markdown").toggle()
			end,
			desc = "Render markdown",
		},
	},
}
