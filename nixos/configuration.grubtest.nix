{ config, pkgs, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      theme = pkgs.runCommand "sekiro_grub_theme" { } ''
        mkdir -p $out
        cp -r ${/home/yugalkhanal/dotfiles/nixos/sekiro_grub_theme}/Sekiro/* $out
      '';
    };
    timeout = 10;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "grub-test";

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";

  # Minimal user
  users.users.test = {
    isNormalUser = true;
    password = "test";
    shell = pkgs.bash;
  };

  environment.systemPackages = with pkgs; [ vim ];

  services.openssh.enable = false;

  system.stateVersion = "24.05";
}
