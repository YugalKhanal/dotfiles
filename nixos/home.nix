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

  news.display = "silent";

  home.packages = with pkgs; [
    # (gimp-with-plugins.override {
    #   plugins = [ pkgs.gimpPlugins.gmic ];
    # })
    gimp3
    kdePackages.gwenview
    jetbrains.goland
    yazi
    qbittorrent
    qbittorrent-cli
    nyaa
    localsend
    wlsunset
    redshift
    nodejs_latest
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
    # texliveFull
    (texlive.withPackages (ps: [
      # ps.titlesec
      ps.latexindent
      ps.adjustbox
    ]))
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
