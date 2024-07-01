{
  description = "desktop conf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      unstable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      ####### desktop ##########################################################
      # nixosConfigurations.<hostname>
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./modules/nix/machines/nixos/configuration.nix ];
        specialArgs = {
          hostname = "nixos";
          unstable = import unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
      };

      homeConfigurations."zspekt@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./modules/home-manager/users/zspekt/home.nix ];
        extraSpecialArgs = {
          hostname = "nixos";
        };
      };

      ####### thinkpad #########################################################
      nixosConfigurations.nixth = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./modules/nix/machines/nixth/configuration.nix ];
        specialArgs = {
          hostname = "nixth";
        };
      };

      homeConfigurations."zspekt@nixth" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./modules/home-manager/users/zspekt/home.nix ];
        extraSpecialArgs = {
          hostname = "nixth";
        };
      };
    };
}
