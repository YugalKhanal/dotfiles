return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,  -- This will show hidden files
          hide_dotfiles = false,  -- This will not hide files starting with a dot
          hide_gitignored = false,  -- This will not hide gitignored files
        },
      },
    })
    vim.keymap.set("n", "<C-n>", "<CMD>Neotree toggle left<CR>")
    vim.keymap.set("n", "<leader>e", "<CMD>Neotree focus left<CR>", { desc = "Focus on Neo-tree" })
  end,
}
