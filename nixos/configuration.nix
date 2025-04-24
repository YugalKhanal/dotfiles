{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./gaming.nix
      ./vm.nix
      ./cloud-storage.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      extraEntriesBeforeNixOS = true;
      theme = pkgs.fetchFromGitHub
        {
          owner = "semimqmo";
          repo = "sekiro_grub_theme";
          rev = "1affe05f7257b72b69404cfc0a60e88aa19f54a6";
          sha256 = "02gdihkd2w33qy86vs8g0pfljp919ah9c13cj4bh9fvvzm5zjfn1";
        } + "/Sekiro";

      gfxmodeEfi = "2560x1440";
      gfxpayloadEfi = "keep";
    };
    timeout = 10;
  };

  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.

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

  # Sound settings
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yugalkhanal = {
    isNormalUser = true;
    description = "yugalkhanal";
    extraGroups = [
      "networkmanager"
      "users"
      "wheel"
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
    wantedBy = [ "default.target" ];
  };

  # systemd.user.services.wireplumber = {
  #   enable = true;
  #   wantedBy = [ "default.target" ];
  # };

  programs.zsh.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin ];
  };

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    agenix-cli
    tldr
    imagemagick
    tree
    tailscale
    pipewire
    pavucontrol # GUI for managing audio
    stow
    lxqt.lxqt-archiver
    zip
    unzip
    gnumake
    openssl
    vim
    wget
    libGL
    lazygit
    firefox
    wireshark
    sqlite
    postgresql_17
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
    nextcloud31
    mpi
    prettierd
    vscode-langservers-extracted
    pkg-config
    llvmPackages_12.openmp
    typescript-language-server
    # texlivePackages.latexindent
    # texlivePackages.adjustbox
    # (texlive.withPackages (ps: [ ps.titlesec ps.adjustbox]))
    texlab
    clang
    nixd
    fyne
    clang-tools
    lua-language-server
    stylua
    nixpkgs-fmt
    ruff
    black
    glib
    go
    lua
    nodejs_23
    python3
    luajit
    bluez
    rustc
    cargo
    ripgrep
    zsh
    zathura
    # texliveFull
    nmap
    htop
    fd
    bat
    lazygit
    discord
    yq
    libreoffice
    certbot
    fastfetch
    gvfs
    waybar
    yt-dlp
    mpv
    ncspot
    nginx
    transmission_4-gtk
    wlogout
    wttrbar
    libnotify
    swww
    rofi-bluetooth
    wofi
    hyprlock
    killall
    OVMF
    bluez
    bluez-tools
    grim
    slurp
    wl-clipboard
    networkmanagerapplet
    spotify
    playerctl
    banana-cursor
    pavucontrol
    tcpdump
    poppler_utils
    bc
    libnotify
    zoom-us
    base16-schemes
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

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Stylix
  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    base16Scheme = {
      base00 = "#181818"; # Background
      base01 = "#282828";
      base02 = "#383838";
      base03 = "#585858";
      base04 = "#b8b8b8";
      base05 = "#d8d8d8"; # Default Text
      base06 = "#e8e8e8";
      base07 = "#f8f8f8";
      base08 = "#ab4642"; # Red
      base09 = "#dc9656"; # Orange
      base0A = "#f7ca88"; # Yellow
      base0B = "#a1b56c"; # Green
      base0C = "#86c1b9"; # Cyan
      base0D = "#7cafc2"; # Blue
      base0E = "#ba8baf"; # Purple
      base0F = "#a16946"; # Brown
    };

    image = ./1363709.png;
    cursor = {
      name = "Banana cursor";
      package = pkgs.banana-cursor;
      size = 50;
    };
    polarity = "dark";
    targets = {
      grub = {
        enable = false;
        useWallpaper = true;
      };
    };
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

  # Make sure the Bluetooth service starts up properly

  # Add the DBus service configuration
  services.dbus.enable = true;
  services.udisks2.enable = true;
  # services.dbus.packages = [ pkgs.bluez ];

  # Enable sound with pipewire .
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 80 443 8080 8000 7000 5000 3000 3030 ];
  networking.firewall.allowedTCPPorts = [ 80 443 8080 8000 7000 5000 3030 3000 3001 3002 3003 3004 3005 3006 3007 3008 3009 3010 ];
  networking.firewall.allowedUDPPorts = [ 3000 3001 3002 3003 3004 3005 3006 3007 3008 3009 3010 5000 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
