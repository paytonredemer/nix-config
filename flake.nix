{
  description = "Payton's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixos-wsl, ... }@inputs: {
    nixosConfigurations = {
      t480s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/t480s/configuration.nix
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
          nixos-hardware.nixosModules.common-gpu-intel
        ];
      };
      # wsl
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/wsl/configuration.nix
          # home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.wsl
        ];
      };
    };
    homeConfigurations = {
      "payton" = nixpkgs.lib.homeManagerConfiguration {
        modules = [ ./home-manager/home.nix ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
    };
  };
}
