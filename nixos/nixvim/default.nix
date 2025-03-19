{ config, lib, pkgs, ... }:
{
  imports = [
    ./aerials.nix
    ./bufferline.nix
    ./comment.nix
    ./completions.nix
    ./dashboard.nix
    ./lsp-config.nix
    ./mappings.nix
    ./none-ls.nix
    ./nvim-tree.nix
    ./telescope.nix
    ./theme.nix
    ./tree-sitter.nix
    ./vim-options.nix
    ./vim-tmux-navigator.nix
    ./vimtex.nix
    ./which-key.nix
  ];
}
