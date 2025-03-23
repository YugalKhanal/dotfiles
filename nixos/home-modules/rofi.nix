{ lib, pkgs, ... }:

let
  mkLiteral = lib.formats.rasi.mkLiteral or (x: x);
  darkBg = mkLiteral "#000000";
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
        background-color = lib.mkForce darkBg;
        foreground-color = lib.mkForce (mkLiteral "@foreground");
      };

      "prompt" = {
        background-color = lib.mkForce darkBg;
        text-color = lib.mkForce (mkLiteral "@foreground");
      };

      "case-indicator" = {
        background-color = lib.mkForce darkBg;
        text-color = lib.mkForce (mkLiteral "@foreground");
      };

      "window" = {
        location = mkLiteral "north";
        anchor = mkLiteral "north";
        fullscreen = false;
        background-color = lib.mkForce darkBg;
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
        background-color = lib.mkForce darkBg;
        text-color = lib.mkForce (mkLiteral "@foreground");
      };


      "entry" = {
        placeholder = "Search…";
        padding = 5;
        text-color = lib.mkForce (mkLiteral "@foreground");
        background-color = lib.mkForce darkBg;
      };

      "textbox" = {
        padding = 10;
        text-color = lib.mkForce (mkLiteral "@foreground");
        background-color = lib.mkForce darkBg;
      };

      "listview" = {
        lines = 10;
        fixed-height = true;
        spacing = 5;
        layout = mkLiteral "vertical";
        scrollbar = false;
        background-color = lib.mkForce darkBg;
      };

      "element" = {
        padding = 10;
        border-radius = 8;
        background-color = lib.mkForce darkBg;
        text-color = lib.mkForce (mkLiteral "@foreground");
      };

      "element selected.normal" = {
        background-color = lib.mkForce (mkLiteral "#333333");
        text-color = lib.mkForce (mkLiteral "#ffffff");
      };

      "element-icon" = {
        size = 32;
        background-color = lib.mkForce (mkLiteral "transparent");
        text-color = lib.mkForce (mkLiteral "@foreground");
      };

      "textbox-prompt-colon" = {
        str = "";
        padding = "0px 8px 0px 0px";
        text-color = lib.mkForce (mkLiteral "@foreground");
      };
    };
  };
}
