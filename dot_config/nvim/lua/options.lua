-- Set <space> as the leader key
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Enable mouse mode, can be useful for resizing splits for example
vim.opt.mouse = "a"

vim.opt.clipboard:append({ "unnamedplus" })

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250

vim.opt.timeout = true

-- Shorter timeout for which-key to show up earlier
vim.opt.timeoutlen = 500

-- Every wrapped line will continue visually indented
vim.opt.breakindent = true

-- Use 2 spaces for tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, in a split preview window
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- GUI colors
vim.opt.termguicolors = true

-- Disable wrap
vim.opt.wrap = false

-- For auto session
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- support alloy
vim.filetype.add({
	extension = {
		alloy = "hcl",
		tf = "terraform",
	},
})

-- custom diagnostic symbols
local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})

-- local function paste()
--   return {
--     vim.fn.split(vim.fn.getreg(""), "\n"),
--     vim.fn.getregtype(""),
--   }
-- end
--
-- vim.g.clipboard = {
-- 	name = "OSC 52",
-- 	copy = {
-- 		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
-- 		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
-- 	},
-- 	paste = {
-- 		["+"] = paste,
-- 		["*"] = paste,
-- 	},
-- }
