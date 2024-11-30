return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files project wide" })
      vim.keymap.set("n", "<leader>sw", builtin.live_grep, { desc = "Live grep project wide" })
      vim.keymap.set("n", "<leader>th", "<CMD>Telescope colorscheme<CR>", { desc = "Change theme" })
      vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "List buffers" })
      vim.keymap.set("n", "<leader>sgc", builtin.git_commits, { desc = "Git commits" })
      vim.keymap.set("n", "<leader>sgb", builtin.git_branches, { desc = "Git branches" })
      vim.keymap.set("n", "<leader>sds", builtin.lsp_document_symbols, { desc = "List document symbols" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help tags" })
      vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "Search recently opened files" })
      vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Search man pages" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
      vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "Search commands" })
      vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "Search quickfix list" })
      vim.keymap.set("n", "<leader>sl", builtin.loclist, { desc = "Search location list" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true, -- This ensures hidden files are shown
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
