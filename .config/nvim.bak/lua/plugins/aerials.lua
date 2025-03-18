return {
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  vim.keymap.set("n", "<leader>co", "<CMD>AerialToggle<CR>", { desc = "Open Code Outline" }),
}
