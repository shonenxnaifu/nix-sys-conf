{
  description = "NixOS PC Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs"; # this line is optional, prevents downloading two versions of nixpkgs but disables cache
    };

    sidra.url = "github:wimpysworld/sidra";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      noctalia,
      sidra,
    }:
    {
      nixosConfigurations.nixos-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit noctalia sidra; };
        modules = [
          ./configuration.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ noctalia.homeModules.default ];
            home-manager.users.shonenxnaifu = import ./home.nix;
          }
        ];
      };
    };
}
