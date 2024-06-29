{ config, lib, ... }:
let
  cfg = config.cli;
in
{
    imports = [
      ./fish.nix
      ./git
      # ./neovim
      # ./nixvim
      ./shell.nix
      ./starship.nix
      ./tmux.nix
      ./yazi.nix
      ./zoxide.nix
      ./zsh.nix
    ];

  options = {
    cli.enable = lib.mkEnableOption "Enables cli programs";
  };

  config = lib.mkIf cfg.enable {
    cli = {
      fish.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      # neovim.enable = lib.mkDefault true;
      # nixvim.enable = lib.mkDefault false;
      shell.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault true;
      tmux.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zoxide.enable = lib.mkDefault true;
      zsh.enable = lib.mkDefault true;
    };
  };
}
