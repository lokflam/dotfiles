return {
	"kamykn/spelunker.vim",
	config = function()
		vim.g.spelunker_check_type = 2
		vim.cmd(
			"highlight SpelunkerSpellBad term=underline cterm=undercurl ctermfg=NONE gui=undercurl guifg=NONE guisp=NONE"
		)
		vim.cmd(
			"highlight SpelunkerComplexOrCompoundWord term=underline cterm=undercurl ctermfg=NONE gui=undercurl guifg=NONE guisp=NONE"
		)
	end,
}
