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

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

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
