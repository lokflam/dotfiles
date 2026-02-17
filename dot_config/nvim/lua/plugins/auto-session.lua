return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		auto_session_suppress_dirs = { "~/", "/" },
	},
	keys = {
		{ "<leader>ss", "<Cmd>SessionSave<CR>", desc = "Save session (AutoSession)" },
		{ "<leader>sr", "<Cmd>SessionRestore<CR>", desc = "Restore session (AutoSession)" },
		{ "<leader>sl", "<Cmd>Autosession search<CR>", desc = "List sessions (AutoSession)" },
		{ "<leader>sd", "<Cmd>Autosession delete<CR>", desc = "Delete session (AutoSession)" },
	},
}
