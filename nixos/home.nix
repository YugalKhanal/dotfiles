{ config, lib, pkgs, ... }:

{
  imports = [
    ./nixvim
    ./home-modules
  ];

  home.username = "yugalkhanal";
  home.homeDirectory = "/home/yugalkhanal";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  programs.nh.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  home.packages = with pkgs; [
    btop
    gtk3
    gtk4
    ghostty
    vimPlugins.nvim-cmp
    bat
    fd
    protonvpn-gui
    ripgrep
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
    base16-schemes
    # texlivePackages.latexindent
    (texlive.withPackages (ps: [ ps.titlesec ps.latexindent ]))
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
