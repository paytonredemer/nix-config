{ inputs, config, pkgs, lib, ... }:

{
  home.username = "payton";
  home.homeDirectory = "/home/payton";

  home.stateVersion = "23.11";

  modules.desktop.enable = true;

  # Enable unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
