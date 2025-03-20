# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./gaming.nix
      ./vm.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.zfs.enabled = true;

  boot.loader.grub = {
    enable = true;
    # version = 2;
    efiSupport = true; # Enable UEFI support
    device = "nodev"; # No specific device for UEFI
  };

  boot.loader.efi = {
    canTouchEfiVariables = true; # Allows writing to UEFI variables
  };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.userControl.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };


  # Configure console keymap
  console.keyMap = "uk";

  # Update your Bluetooth configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yugalkhanal = {
    isNormalUser = true;
    description = "yugalkhanal";
    # extraGroups = [ "users" "make" "network" "networkmanager" "wheel" "wireshark" "docker" ];
    extraGroups = [
      "networkmanager"
      "users"
      "wheel"
      "wireshark"
      "docker"
      "audio"
      "video"
      "input"
      "systemd-journal"
      "disk"
      "storage"
      "plugdev"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;

  systemd.user.services.pipewire = {
    enable = true;
    wantedBy = [ "default.target" ];
  };

  systemd.user.services.wireplumber = {
    enable = true;
    wantedBy = [ "default.target" ];
  };

  systemd.user.services.darkman = {
    enable = true;
    description = "Darkman system-wide dark mode daemon";
    serviceConfig = {
      ExecStart = "${pkgs.darkman}/bin/darkman --server";
      Restart = "always";
    };
    wantedBy = [ "default.target" ];
  };

  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    tldr
    imagemagick
    tree
    tailscale
    pulseaudio
    pipewire
    pavucontrol # GUI for managing audio
    stow
    lxqt.lxqt-archiver
    zip
    unzip
    gnumake
    vim
    wget
    lazygit
    firefox
    wireshark
    ghostty
    brave
    tmux
    git
    inetutils
    docker
    gcc
    cmake
    pyright
    texlab
    gopls
    hyprls
    mpi
    prettierd
    vscode-langservers-extracted
    pkg-config
    llvmPackages_12.openmp
    python312Packages.numpy
    python312Packages.matplotlib
    typescript-language-server
    texlivePackages.latexindent
    texlab
    clang
    nixd
    clang-tools
    lua-language-server
    stylua
    nixpkgs-fmt
    ruff
    black
    glib
    go
    lua
    nodejs_22
    python3
    luajit
    bluez
    rustc
    cargo
    ripgrep
    zsh
    zathura
    texliveFull
    nmap
    htop
    fd
    bat
    lazygit
    discord
    vesktop
    yq
    wireshark
    jetbrains.goland
    libreoffice
    certbot
    fastfetch
    xfce.thunar
    gvfs
    waybar
    spicetify-cli
    yt-dlp
    mpv
    ncspot
    transmission_4-gtk
    wlogout
    wttrbar
    libnotify
    swww
    rofi-wayland
    rofi-bluetooth
    wofi
    hyprlock
    killall
    OVMF
    bluez
    bluez-tools
    qbittorrent
    gtk2
    gtk3
    gtk4
    grim
    slurp
    wl-clipboard
    networkmanagerapplet
    spotify
    playerctl
    banana-cursor
    pavucontrol
    tcpdump
    warp-terminal
    poppler_utils
    bc
    libnotify
    darkman
    zoom-us
  ];

  # cleanup
  nix.gc = {
    automatic = true;
    dates = "weekly"; # Run GC every week
    options = "--delete-older-than 7d"; # Keep only the last 7 days of generations
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # XCURSOR_THEME = "banana-cursor";
    # XCURSOR_SIZE = "24";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  # Stylix
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "1e1e2e";
      base01 = "181825";
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "fab387"; # peach
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo
    };
    image = ./1363709.png;
    cursor = {
      name = "Banana cursor";
      package = pkgs.banana-cursor;
      size = 50;
    };
    polarity = "dark";
  };

  # List services that you want to enable:
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Configure keymap in X11, separate in hyprland
  services.xserver.xkb = {
    layout = "gb";
    variant = "mac";
  };

  services.tailscale.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.pulseaudio.enable = true;

  # Make sure the Bluetooth service starts up properly
  services.blueman.enable = true;

  # Add the DBus service configuration
  services.dbus.enable = true;
  services.udisks2.enable = true;
  # services.dbus.packages = [ pkgs.bluez ];

  # Enable sound with pipewire .
  security.rtkit.enable = true;
  services.pipewire = {
    enable = false;
    # alsa.enable = true;
    # alsa.support32Bit = true;
    # pulse.enable = true;
    # jack.enable = true;
    # wireplumber.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 80 443 8080 8000 7000 5000 3000 3030 ];
  networking.firewall.allowedTCPPorts = [ 80 443 8080 8000 7000 5000 3030 3000 ];
  networking.firewall.allowedUDPPorts = [ 3000 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
