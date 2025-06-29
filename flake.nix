{
  description = "desktop conf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "unstable";
    };

    sesh-latest.url = "github:zspekt/sesh.nix";
    # sesh-latest.url = "git+file:///home/zspekt/coding/nix/pkgs/sesh.nix";

    tmux-latest.url = "github:zspekt/tmux-latest.nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { self, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    # overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
    {
      ####### desktop ##########################################################
      # nixosConfigurations.<hostname>
      nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/nix/machines/nixos/configuration.nix
          # { nixpkgs.overlays = overlays; }
        ];
        specialArgs = {
          inherit inputs;
          inherit system;
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
          # { nixpkgs.overlays = overlays; }
        ];
        extraSpecialArgs = {
          inherit inputs;
          hostname = "nixos";
        };
      };

      ####### thinkpad #########################################################
      nixosConfigurations.nixth = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/nix/machines/nixth/configuration.nix
          # { nixpkgs.overlays = overlays; }
        ];
        specialArgs = {
          inherit inputs;
          inherit system;
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
          # { nixpkgs.overlays = overlays; }
        ];
        specialArgs = {
          inherit inputs;
          system = "aarch64-linux";
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
