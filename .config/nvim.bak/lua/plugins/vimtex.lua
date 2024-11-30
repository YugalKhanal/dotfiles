return {
	"lervag/vimtex",
	event = "BufRead *.tex",
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.cmd([[set conceallevel=2]])
		vim.cmd([[let g:tex_conceal='abdmg']])
	end,
}
