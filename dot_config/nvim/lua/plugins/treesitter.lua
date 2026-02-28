return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	init = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldenable = false
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
	opts = {
		ensure_installed = {
			"bash",
			"comment",
			"css",
			"gitignore",
			"go",
			"gomod",
			"gosum",
			"gotmpl",
			"gowork",
			"helm",
			"html",
			"javascript",
			"jq",
			"json",
			"kdl",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"sql",
			"terraform",
			"tmux",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>tl",
				node_incremental = "<leader>tl",
				scope_incremental = false,
				node_decremental = "<leader>th",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["ak"] = "@class.outer",
					["ik"] = "@class.inner",
					["ac"] = "@comment.outer",
					["ic"] = "@comment.inner",
					["ap"] = "@parameter.outer",
					["ip"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jump = true,
				goto_next_start = {
					["]f"] = "@function.outer",
					["]<leader>"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
					["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
				},
				goto_next_end = {
					["]F"] = "@function.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[<leader>"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
					["[z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
				},
				goto_previous_end = {
					["[F"] = "@function.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>ta"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>tA"] = "@parameter.inner",
				},
			},
		},
	},
}
