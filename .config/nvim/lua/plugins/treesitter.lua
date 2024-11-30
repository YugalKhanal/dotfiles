return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			-- auto_install = true,
			ensure_installed = {"lua", "python", "javascript", "go", "c", "vim", "html", "asm"},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
