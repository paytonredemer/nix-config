{
  description = "Payton's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs: {
    nixosConfigurations = {
      t480s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/t480s/configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
          nixos-hardware.nixosModules.common-gpu-intel
        ];
      };
    };
  };
}
