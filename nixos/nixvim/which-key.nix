{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    
    plugins.which-key = {
      enable = true;
      
      # Add just a few basic registrations
      registrations = {
        "<leader>f" = "Find";
        "<leader>c" = "Code";
        "<leader>w" = "Window";
      };
    };
  };
}
