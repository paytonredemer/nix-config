{ inputs, config, pkgs, lib, ... }:

{
  home.username = "redemerpayton";
  home.homeDirectory = "/home/redemerpayton";

  home.stateVersion = "23.11";

  imports = [
    ../modules/cli/git
    ../modules/cli/shell.nix
    ../modules/cli/fish.nix
    ../modules/cli/starship.nix
    ../modules/cli/neovim
    ../modules/cli/tmux.nix
    ../modules/cli/zsh.nix
    ../modules/cli/yazi.nix
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
