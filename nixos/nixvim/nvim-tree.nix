{
  programs.nixvim = {
    config = {
      plugins.nvim-tree = {
        enable = true;
        filters = {
          dotfiles = false;
        };
        git = {
          enable = true;
          ignore = false;
        };
        view = {
          side = "left";
        };
      };

      keymaps = [
        { mode = "n"; key = "<C-n>"; action = "<CMD>NvimTreeToggle<CR>"; options.desc = "Toggle NvimTree"; }
        { mode = "n"; key = "<leader>e"; action = "<CMD>NvimTreeFocus<CR>"; options.desc = "Focus on NvimTree"; }
      ];
    };
  };
}
