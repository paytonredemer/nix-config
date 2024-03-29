{ inputs, config, pkgs, lib, ... }:

{
  home.username = "payton";
  home.homeDirectory = "/home/payton";

  home.stateVersion = "23.11";

  imports = [
    ../modules/cli
    # ./modules/desktop
  ];

  # Enable unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
