{
	description = "desktop conf";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    dotfiles = {
      flake = false;
      url = "git+https://github.com/zspekt/dotfiles?submodules=1";
    };
	};

	outputs = {nixpkgs, home-manager, ... }@inputs:
	let 
		system = "x86_64-linux";
	in {
	# nixosConfigurations.<hostnameDefinedOnConfiguration.nix>
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ ./configuration.nix ];
		};
		homeConfigurations.zspekt = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home.nix ];
      extraSpecialArgs = {inherit inputs;};
		};
	};
}


