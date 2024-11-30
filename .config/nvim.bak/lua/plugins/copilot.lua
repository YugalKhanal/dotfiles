return {
	"github/copilot.vim",
	lazy = false,
  config = function ()
    vim.keymap.set('n', '<space>cd', '<cmd>Copilot disable<CR>', {desc = 'Disable copilot'})
    vim.keymap.set('n', '<space>ce', '<cmd>Copilot enable<CR>', {desc = 'Enable copilot'})
  end
}
