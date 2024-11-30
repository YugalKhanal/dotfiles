return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})
		lspconfig.nixd.setup({
			capabilities = capabilities,
		})
		lspconfig.gopls.setup({
			capabilities = capabilities,
			settings = {
				gopls = {
					buildFlags = { "-mod=mod" },
					env = { GOFLAGS = "-mod=mod" },
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					usePlaceholders = false,
					completeUnimported = true,
					-- allowModfileModifications = true,
				},
			},
		})
		-- lspconfig.clangd.setup({
		-- 	capabilities = capabilities,
		-- })
		lspconfig.clangd.setup({
			capabilities = capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp" },
			cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
			root_dir = function()
				return vim.loop.cwd() -- Adjust if you need a different root directory strategy
			end,
		})
		lspconfig.ruff.setup({
			capabilities = capabilities,
		})
		lspconfig.texlab.setup({
			capabilities = capabilities,
		})
		-- lspconfig.nil_ls.setup({
		--   capabilities = capabilities,
		-- })
		lspconfig.hyprls.setup({
			capabilities = capabilities,
		})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions when hovering on a W/E" })
	end,
}
