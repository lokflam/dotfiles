return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		panel = {
			enabled = false,
		},
		suggestion = {
			auto_trigger = true,
			debounce = 50,
			keymap = {
				accept = "<C-M-y>",
				accept_word = "<C-M-w>",
				next = "<C-M-j>",
				prev = "<C-M-k>",
			},
		},
		filetypes = {
			yaml = true,
			markdown = true,
		},
	},
}
