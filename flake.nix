{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, flake-utils, ... }:

    let
      system = "x86_64-linux";
      username = "ceephax";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

    in {

      defaultPackage."${system}" = home-manager.defaultPackage."${system}";

      nixosConfigurations = {
        slurm = with lib;
          nixosSystem {
            inherit system;
            specialArgs = { inherit inputs lib system; };
            modules = [ ./hosts/slurm/default.nix ];
          };
      };
    };
}
