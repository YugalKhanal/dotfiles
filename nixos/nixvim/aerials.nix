{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    # No enable = true here
    
    config = {
    
    plugins = {
      aerial = {
        enable = true;
      };
      treesitter.enable = true; # Required dependency
      # nvim-web-devicons.enable = true; # Optional dependency for icons
    };
    
    keymaps = [
      { mode = "n"; key = "<leader>co"; action = "<CMD>AerialToggle<CR>"; options.desc = "Open Code Outline"; }
    ];
    };
  };
}
