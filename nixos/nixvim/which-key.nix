{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
  config = {
    plugins.which-key = {
      enable = true;
    };
  };
    
  };
}
