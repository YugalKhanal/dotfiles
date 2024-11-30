{ config, pkgs, ... }:

{
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    # most wayland compositors need this
    nvidia.modesetting.enable = true;
    nvidia.open = true;
  };

  programs.steam = {
    enable = true;
    protontricks.enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  zramSwap.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    lutris
    heroic
    # bottles
    wine
    wineWowPackages.full # (optional: for 32-bit and 64-bit support)
    # bottles-unwrapped
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/yugalkhanal/.steam/root/compatibilitytools.d";
  };

  # environment = {
  #   variables = {
  #     XDG_SESSION_TYPE = "wayland";
  #     __GL_GSYNC_ALLOWED = "1";
  #     __GL_VRR_ALLOWED = "0";
  #     QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  #     QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #     STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/yugalkhanal/.steam/root/compatibilitytools.d";
  #   };
  #
  #   sessionVariables = {
  #     NIXOS_OZONE_WL = "1";
  #     WLR_NO_HARDWARE_CURSORS = "1";
  #   };
  # };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
