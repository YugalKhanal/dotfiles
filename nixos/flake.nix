{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    sekiro-theme.url = "path:./sekiro_grub_theme";
  };

  outputs = { self, nixpkgs, home-manager, stylix, nixvim, sekiro-theme, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            stylix.nixosModules.stylix
            ({ config, pkgs, ... }: {
              _module.args.sekiroTheme = sekiro-theme;
            })
          ];
        };
      };
      homeConfigurations = {
        yugalkhanal = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            nixvim.homeManagerModules.nixvim
            stylix.homeManagerModules.stylix
          ];
        };
      };
    };
}
