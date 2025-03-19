{ config, lib, pkgs, ... }:
{
  programs.nixvim = {
    config = {
      plugins.tmux-navigator.enable = true;
    };
  };
}
