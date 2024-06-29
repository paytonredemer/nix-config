{ inputs, config, pkgs, lib, ... }:

{
  home.username = "payton";
  home.homeDirectory = "/home/payton";

  home.stateVersion = "23.11";

  imports = [
    ../modules/gui
    ../modules/gui/i3.nix
  ];

  # Enable unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
