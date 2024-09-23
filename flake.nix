{
  description = "desktop conf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    custom-sesh.url = "github:zspekt/sesh.nix";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { self, ... }@inputs:
    let
      system = "x86_64-linux";
      overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
    in
    {
      ####### desktop ##########################################################
      # nixosConfigurations.<hostname>
      nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/nix/machines/nixos/configuration.nix
          { nixpkgs.overlays = overlays; }
        ];
        specialArgs = {
          inherit inputs;
          hostname = "nixos";
          unstable = import inputs.unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
      };

      homeConfigurations."zspekt@nixos" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        modules = [
          ./modules/home-manager/users/zspekt/home.nix
          { nixpkgs.overlays = overlays; }
        ];
        extraSpecialArgs = {
          hostname = "nixos";
        };
      };

      ####### thinkpad #########################################################
      nixosConfigurations.nixth = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/nix/machines/nixth/configuration.nix
          { nixpkgs.overlays = overlays; }
        ];
        specialArgs = {
          inherit inputs;
          hostname = "nixth";
          unstable = import inputs.unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
      };

      homeConfigurations."zspekt@nixth" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        modules = [ ./modules/home-manager/users/zspekt/home.nix ];
        extraSpecialArgs = {
          hostname = "nixth";
        };
      };

      ####### raspi ############################################################
      nixosConfigurations.nixpi = inputs.nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./modules/nix/machines/nixpi/configuration.nix
          { nixpkgs.overlays = overlays; }
        ];
        specialArgs = {
          inherit inputs;
          hostname = "nixpi";
          unstable = import inputs.unstable {
            system = "aarch64-linux";
            config.allowUnfree = true;
          };
        };
      };

      homeConfigurations."zspekt@nixpi" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${"aarch64-linux"};
        modules = [ ./modules/home-manager/users/zspekt/home.nix ];
        extraSpecialArgs = {
          hostname = "nixpi";
        };
      };
    };
}
