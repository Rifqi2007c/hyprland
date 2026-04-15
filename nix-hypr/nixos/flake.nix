{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    stylix = {
#      url = "github:nix-community/stylix";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        nixvim.nixosModules.nixvim
	home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
	    useUserPackages = true;
	    users.rifqi = import ./home.nix;
	  };
	}
      ];
    };


    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
