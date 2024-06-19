{
  description = "Payton's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixos-wsl, agenix, nixvim, ... }@inputs: {
    nixosConfigurations = {
      t480s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/t480s/configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          # nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
          # nixos-hardware.nixosModules.common-gpu-intel
        ];
      };
      x220 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/x220/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/wsl/configuration.nix
          nixos-wsl.nixosModules.wsl
        ];
      };
      work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/work/configuration.nix
          nixos-wsl.nixosModules.wsl
        ];
      };
      teddy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/teddy/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      "payton@t480s" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/payton/t480s.nix
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
      "payton@wsl" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./home/payton/wsl.nix
          nixvim.homeManagerModules.nixvim
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
      "redemerpayton@work" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/payton/work.nix
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
      "payton@teddy" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./home/payton/wsl.nix
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
    };
  };
}
