{ pkgs, ... }:
{
  config = {
    programs.nixvim = {
      extraPlugins = with pkgs.vimPlugins; [
        nvterm
      ];


      extraConfigLua = ''
        require("nvterm").setup()

        local terminal = require("nvterm.terminal")
        local ft_cmds = {
          python = "python3 " .. vim.fn.expand('%'),
        }

        local toggle_modes = { "n", "t" }
        local mappings = {
          { "n", "<C-l>", function() terminal.send(ft_cmds[vim.bo.filetype]) end },
          { toggle_modes, "<leader>tr", function() terminal.toggle("horizontal") end },
          { toggle_modes, "<A-v>", function() terminal.toggle("vertical") end },
          { toggle_modes, "<A-i>", function() terminal.toggle("float") end },
        }

        local opts = { noremap = true, silent = true }
        for _, mapping in ipairs(mappings) do
          vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
        end
      '';

    };
  };
}
