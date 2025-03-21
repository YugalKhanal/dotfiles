{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    config = {
      plugins.copilot-vim = {
        enable = true;
      };
      keymaps = [
        { mode = "n"; key = "<space>cd"; action = "<cmd>Copilot disable<CR>"; options.desc = "Disable copilot"; }
        { mode = "n"; key = "<space>ce"; action = "<cmd>Copilot enable<CR>"; options.desc = "Enable copilot"; }
      ];
    };
  };
}
