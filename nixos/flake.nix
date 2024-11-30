# {
#   description = "Nixos config flake";
#
#   inputs = {
#     nixpkgs.url = "nixpkgs/nixos-unstable";
#
#     home-manager = {
#       url = "github:nix-community/home-manager";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#   };
#
#   outputs = { self, nixpkgs, ... }@inputs: {
#     nixosConfigurations.default = nixpkgs.lib.nixosSystem {
#       specialArgs = {inherit inputs;};
#       modules = [
#         ./configuration.nix
#         inputs.home-manager.nixosModules.default
#       ];
#     };
#   };
# }

{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        yugalkhanal = home-manager.lib.homeManagerConfiguration {
          # system = "x86_64-linux";
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };

    };

}
