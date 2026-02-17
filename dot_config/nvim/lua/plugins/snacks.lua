return {
	"folke/snacks.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		toggle = { enabled = true },
		words = { enabled = true },
		scope = { enabled = true },
		picker = {
			enabled = true,
			win = {
				input = {
					keys = {
						["<s-a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
						["<s-a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
						["<s-a-f>"] = { "toggle_follow", mode = { "i", "n" } },
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>nn",
			function()
				require("snacks").notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>nd",
			function()
				require("snacks").notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>bd",
			function()
				require("snacks").bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>bD",
			function()
				require("snacks").bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},
		{
			"<leader>r",
			function()
				require("snacks").rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				require("snacks").gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gb",
			function()
				require("snacks").git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gf",
			function()
				require("snacks").lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				require("snacks").lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"]]",
			function()
				require("snacks").words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				require("snacks").words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					finder = "buffers",
					format = "buffer",
					hidden = false,
					unloaded = true,
					current = false,
					sort_lastused = true,
					win = {
						input = {
							keys = {
								["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
							},
						},
						list = { keys = { ["dd"] = "bufdelete" } },
					},
				})
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fd",
			function()
				require("snacks").picker.git_diff()
			end,
			desc = "Find Git Diff",
		},
		{
			"<leader>fe",
			function()
				Snacks.picker.explorer()
			end,
			desc = "Show Explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fF",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.lines()
			end,
			desc = "File lines",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_grep()
			end,
			desc = "Git Grep",
		},
		{
			"<leader>fG",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
	},
	init = function()
		local snacks = require("snacks")
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				snacks.toggle.diagnostics():map("<leader>ud")
				snacks.toggle.line_number():map("<leader>ul")
				snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				snacks.toggle.treesitter():map("<leader>uT")
				snacks.toggle.inlay_hints():map("<leader>uh")
			end,
		})
	end,
}
