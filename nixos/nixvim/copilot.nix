{ lib, pkgs, ... }:

{
  programs.nixvim = {
    config = {
      plugins = {
        copilot-vim = {
          enable = true;
          package = pkgs.vimPlugins.copilot-vim.overrideAttrs (old: {
            meta.license = lib.licenses.unfree;
          });
          settings = {
            node_command = lib.getExe pkgs.nodejs_latest;
          };
        };
        copilot-chat = {
          enable = true;
        };
      };

      keymaps = [
        { mode = "n"; key = "<space>cd"; action = "<cmd>Copilot disable<CR>"; options.desc = "Disable copilot"; }
        { mode = "n"; key = "<space>ce"; action = "<cmd>Copilot enable<CR>"; options.desc = "Enable copilot"; }
        { mode = "n"; key = "<space>cw"; action = "<cmd>CopilotChatToggle<CR>"; options.desc = "Toggle copilot chat window"; }
      ];
    };
  };
}
