return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Next hunk (Gitsigns)" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Previous hunk (Gitsigns)" })

			-- Actions
			map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk (Gitsigns)" })
			map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk (Gitsigns)" })
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage hunk (Gitsigns)" })
			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset hunk (Gitsigns)" })
			map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer (Gitsigns)" })
			map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer (Gitsigns)" })
			map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk (Gitsigns)" })
			map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk (Gitsigns)" })
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Show full line blame (Gitsigns)" })
			map("n", "<leader>htb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame (Gitsigns)" })
			map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff with commit (Gitsigns)" })
			map("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end, { desc = "Diff with staged (Gitsigns)" })
			map("n", "<leader>htd", gitsigns.toggle_deleted, { desc = "Toggle deleted (Gitsigns)" })

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Inner hunk (Gitsigns)" })
		end,
	},
}
