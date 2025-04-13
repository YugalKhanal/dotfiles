{ lib, pkgs, config, ... }:
{
  config = {
    programs.nixcord = {
      enable = true;
      discord.vencord.package = pkgs.vencord;
      vesktop.enable = true;
      discord.enable = true;
      config = {
        frameless = true;
        plugins = {
          alwaysAnimate.enable = true;
          anonymiseFileNames = {
            enable = true;
            anonymiseByDefault = true;
          };
          spotifyControls.enable = true;
          fakeNitro.enable = true;
          translate.enable = true;
          clearURLs.enable = true;
          fixYoutubeEmbeds.enable = true;
          noTrack.enable = true;
          petpet.enable = true;
          spotifyShareCommands.enable = true;
          youtubeAdblock.enable = true;
        };
      };
    };
  };
}
