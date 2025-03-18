{ config, pkgs, ... }:

{

  imports = [
  ./sh.nix
  ./nixvim
  ];
  # imports = [ /home/yugalkhanal/.dotfiles/nixos/sh.nix ];
  home.username = "yugalkhanal";
  home.homeDirectory = "/home/yugalkhanal";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs.nixvim.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # plugins = with pkgs.vimPlugins; [
    #   nvim-lspconfig
    #   comment-nvim
    #   aerial-nvim
    #   auto-pairs
    #   nvim-cmp
    #   luasnip
    #   cmp-nvim-lsp
    #   copilot-vim
    #   dashboard-nvim
    #   gitsigns-nvim
    #   indent-blankline-nvim
    #   lazygit-nvim
    #   leap-nvim
    #   leetcode-nvim
    #   neo-tree-nvim
    #   none-ls-nvim
    #   nvterm
    #   presence-nvim
    #   telescope-nvim
    #   nvim-treesitter
    #   trim-nvim
    #   vim-devicons
    #   vim-tmux-navigator
    #   vimtex
    #   which-key-nvim
    #   telescope-fzf-native-nvim
    #   friendly-snippets
    #   lualine-nvim
    #
    #   (nvim-treesitter.withPlugins (p: [
    #     p.tree-sitter-nix
    #     p.tree-sitter-python
    #     p.tree-sitter-javascript
    #     p.tree-sitter-html
    #     p.tree-sitter-css
    #     p.tree-sitter-lua
    #     p.tree-sitter-go
    #     p.tree-sitter-rust
    #     p.tree-sitter-c
    #     p.tree-sitter-cpp
    #     p.tree-sitter-java
    #     p.tree-sitter-json
    #     p.tree-sitter-toml
    #     p.tree-sitter-yaml
    #     p.tree-sitter-bash
    #     p.tree-sitter-vim
    #   ]))
    #
    #   vim-nix
    # ];
    #
    # extraLuaConfig = ''
    #   -- Write Lua code here
    #   -- or interpolate files like this:
    # '';
  };

  # ${builtins.readFile ./nvim/options.lua}
  home.packages = with pkgs; [
    vimPlugins.nvim-cmp
    bat
    fd
    protonvpn-gui
    ripgrep
    fzf
    fontconfig
    zoxide
    hello
    eza
    git
    banana-cursor
    swaynotificationcenter
    inetutils
    wlsunset
    wlr-randr
    networkmanagerapplet
    mpi
    nerd-fonts.jetbrains-mono

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yugalkhanal/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";

    # Add the cursor settings here:
    XCURSOR_THEME = "banana-cursor"; # Set the banana cursor theme
    XCURSOR_SIZE = "24"; # Optional: Set cursor size

  };

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
