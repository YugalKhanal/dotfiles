-- return {
--     "folke/which-key.nvim",
--     dependencies = {
--         "echasnovski/mini.icons", version = false,
--     },
--     event = "VeryLazy",
--     opts = {
--         plugins = {
--             spelling = {
--                 enabled = true, -- enable the spelling plugin
--                 suggestions = 20, -- how many suggestions should be shown in the list?
--             },
--         },
--         icons = {
--             breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--             separator = "➜", -- symbol used between a key and its label
--             group = "+", -- symbol prepended to a group
--         },
--         window = {
--             border = "single", -- none, single, double, shadow
--             position = "bottom", -- bottom, top
--         },
--         layout = {
--             height = { min = 4, max = 25 }, -- min and max height of the columns
--             width = { min = 20, max = 50 }, -- min and max width of the columns
--             spacing = 3, -- spacing between columns
--         },
--         hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
--         show_help = true, -- show help message on the command line when the popup is visible
--         keymaps = {
--             ["<leader>"] = {
--                 f = {
--                     name = "file", -- optional group name
--                     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--                     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
--                     n = { "New File" }, -- just a label, don't create any mapping
--                 },
--                 b = { "<cmd>Telescope buffers<cr>", "List Buffers" },
--                 c = { "<cmd>Telescope commands<cr>", "Search Commands" },
--                 ds = { "<cmd>Telescope lsp_document_symbols<cr>", "List Document Symbols" },
--                 h = { "<cmd>Telescope help_tags<cr>", "Search Help Tags" },
--                 k = { "<cmd>Telescope keymaps<cr>", "Search Keymaps" },
--                 l = { "<cmd>Telescope loclist<cr>", "Search Location List" },
--                 m = { "<cmd>Telescope man_pages<cr>", "Search Man Pages" },
--                 o = { "<cmd>Telescope oldfiles<cr>", "Search Recently Opened Files" },
--                 q = { "<cmd>Telescope quickfix<cr>", "Search Quickfix List" },
--                 w = { "<cmd>Telescope live_grep<cr>", "Live Grep Project Wide" },
--             },
--         },
--     },
--     keys = {
--         { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
--     },
-- }

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
}
