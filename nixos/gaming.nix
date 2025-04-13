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
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  zramSwap.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    lutris
    heroic
    bottles
    wine
    wineWowPackages.full # (optional: for 32-bit and 64-bit support)
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/yugalkhanal/.steam/root/compatibilitytools.d";
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
