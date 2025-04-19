{
  programs.nixvim = {
    config = {
      plugins = {
        aerial = {
          enable = true;
        };
        treesitter.enable = true;
      };

      keymaps = [
        { mode = "n"; key = "<leader>co"; action = "<CMD>AerialToggle<CR>"; options.desc = "Open Code Outline"; }
      ];
    };
  };
}
