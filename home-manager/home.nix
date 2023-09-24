{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "payton";
  home.homeDirectory = "/home/payton";

  home.stateVersion = "23.05";

  imports = [
    ./modules/cli
    ./modules/desktop
  ];

  # Enable unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
