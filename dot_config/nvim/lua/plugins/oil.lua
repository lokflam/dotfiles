return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	event = "VeryLazy",
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["gd"] = {
				desc = "Oil: Toggle file DETAIL view",
				callback = function()
					DETAIL = not DETAIL
					if DETAIL then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
		},
	},
	keys = {
		{ "-", "<Cmd>Oil<CR>", desc = "Open parent directory (Oil)" },
	},
}
