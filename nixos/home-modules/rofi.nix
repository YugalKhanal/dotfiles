{ lib, pkgs, ... }:

let
  mkLiteral = lib.formats.rasi.mkLiteral or (x: x);
in
{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.ghostty}/bin/ghostty";
    location = "top";
    yoffset = 65;

    theme = {
      "*" = {
        width = 600;
        border = 0;
        border-radius = 10;
        background-color = lib.mkForce (mkLiteral "@background");
        foreground-color = lib.mkForce (mkLiteral "@foreground");
      };

      "window" = {
        location = mkLiteral "north";
        anchor = mkLiteral "north";
        fullscreen = false;
        background-color = lib.mkForce (mkLiteral "@background");
        padding = 10;
        margin = 0;
      };

      "mainbox" = {
        orientation = mkLiteral "vertical";
        spacing = 10;
        margin = 0;
      };

      "inputbar" = {
        enabled = true;
        padding = 10;
        border-radius = 6;
        background-color = lib.mkForce (mkLiteral "@lightbg");
      };

      "entry" = {
        placeholder = "Search…";
        padding = 5;
        text-color = lib.mkForce (mkLiteral "@foreground");
        background-color = lib.mkForce (mkLiteral "transparent");
      };

      "listview" = {
        lines = 10;
        fixed-height = true;
        spacing = 5;
        layout = mkLiteral "vertical";
        scrollbar = false;
      };

      "element" = {
        padding = 10;
        border-radius = 8;
        background-color = lib.mkForce (mkLiteral "@background");
      };

      "element selected.normal" = {
        background-color = lib.mkForce (mkLiteral "@selected-normal-background");
        text-color = lib.mkForce (mkLiteral "@selected-normal-text");
      };

      "element-icon" = {
        size = 32;
      };

      "textbox-prompt-colon" = {
        str = "";
        padding = "0px 8px 0px 0px";
      };

      "textbox" = {
        padding = 10;
        text-color = lib.mkForce (mkLiteral "@foreground");
      };
    };
  };
}
