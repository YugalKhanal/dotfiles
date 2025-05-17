{
  imports = [
    ./aerials.nix
    ./bufferline.nix
    ./comment.nix
    ./completions.nix
    ./copilot.nix
    ./dashboard.nix
    ./lazygit.nix
    ./leap.nix
    ./lsp-config.nix
    ./mappings.nix
    ./none-ls.nix
    ./nvim-tree.nix
    ./presence.nix
    # ./snacks.nix
    ./telescope.nix
    ./theme.nix
    ./nvterm.nix
    ./tree-sitter.nix
    ./vim-options.nix
    ./vim-tmux-navigator.nix
    ./vimtex.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
