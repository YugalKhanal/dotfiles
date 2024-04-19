return {
	"folke/tokyonight.nvim",
  name = "tokyonight-night",
	priority = 1000,
  config = function()
    vim.cmd.colorscheme("tokyonight")
  end,
	-- opts = {},
}
