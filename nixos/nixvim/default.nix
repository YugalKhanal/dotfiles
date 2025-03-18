{ config, lib, pkgs, ... }:
{
  imports = [
  ./aerials.nix
  ./which-key.nix
  # ./comment.nix
  # ./completions.nix
  # ./lsp-config.nix
  # ./mappings.nix
  ./vim-options.nix
  ];
}
