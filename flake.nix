{
  description = "Zeno's Grimoire";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 
  outputs = inputs @ { nixpkgs, home-manager, ...}: {
    nixosConfigurations = {
      envy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
	
        modules = [
          ./hosts/envy/configuration.nix
	  ./users/zeno.nix
	];
      };
    };
  };
}
