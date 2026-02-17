return {
	"echasnovski/mini.icons",
	event = "VeryLazy",
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},
	init = function()
		require("mini.icons").mock_nvim_web_devicons()
		return package.loaded["nvim-web-devicons"]
	end,
}
