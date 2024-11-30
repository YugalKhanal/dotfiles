return {
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("leetcode").setup({
        arg = "leetcode.nvim",

        lang = "python3",

        storage = {
          home = vim.fn.stdpath("data") .. "/leetcode",
          cache = vim.fn.stdpath("cache") .. "/leetcode",
        },

        plugins = {
          non_standalone = false,
        },

        logging = true,

        injector = {
          ["python3"] = {
            before = { "from typing import List", "from utils import time_function" },
            after = {
              'if __name__ == "__main__":',
              "    S = Solution()",
            },
          },
        },

        cache = {
          update_interval = 60 * 60 * 24 * 7,
        },

        console = {
          open_on_runcode = true,

          dir = "row",

          size = {
            width = "90%",
            height = "75%",
          },

          result = {
            size = "60%",
          },

          testcase = {
            virt_text = true,

            size = "40%",
          },
        },

        description = {
          position = "left",

          width = "40%",

          show_stats = true,
        },

        hooks = {
          ["enter"] = {},

          ["question_enter"] = {
            function()
              local function DisplayImage(url)
                local handle = io.popen("curl -s " .. url .. " | imgcat")
                local result = handle:read("*a")
                handle:close()
                print(result)
              end

              local function DetectAndDisplayImages()
                local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                for _, line in ipairs(lines) do
                  if string.match(line, "https://.*%.jpg") or string.match(line, "https://.*%.png") then
                    local url = string.match(line, "(https://.*%.jpg)") or string.match(line, "(https://.*%.png)")
                    DisplayImage(url)
                  end
                end
              end

              DetectAndDisplayImages()
            end,
          },

          ["leave"] = {},
        },

        keys = {
          toggle = { "q" },
          confirm = { "<CR>" },

          reset_testcases = "r",
          use_testcase = "U",
          focus_testcases = "H",
          focus_result = "L",
        },

        theme = {},

        image_support = false,
      })
    end,

    vim.keymap.set('n', '<leader>lc', '<CMD>Leet<CR>', {desc = 'Start leetcode'}),
    vim.keymap.set('n', '<leader>lr', '<CMD>Leet run<CR>', {desc = 'Run solution'}),
    vim.keymap.set('n', '<leader>ls', '<CMD>Leet submit<CR>', {desc = 'Submit solution'}),
    vim.keymap.set('n', '<leader>li', '<CMD>Leet info<CR>', {desc = 'Show info on current question'}),
    vim.keymap.set('n', '<leader>ll', '<CMD>Leet lang<CR>', {desc = 'Change language for current question'}),
    vim.keymap.set('n', '<leader>lp', '<CMD>Leet list<CR>', {desc = 'Open a question picker list'}),
    vim.keymap.set('n', '<leader>ld', '<CMD>Leet daily<CR>', {desc = 'Open the leetcode daily'}),
  }
}
