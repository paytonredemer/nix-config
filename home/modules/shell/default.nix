{ config, lib, ... }:
let
  cfg = config.modules.shell;
in
{
    imports = [
      ./fish.nix
      ./git
      ./shell.nix
      ./starship.nix
      ./tmux.nix
      ./yazi.nix
      ./zoxide.nix
      ./zsh.nix
    ];

  options = {
    modules.shell.enable = lib.mkEnableOption "Enables modules.shell programs";
  };

  config = lib.mkIf cfg.enable {
    modules.shell = {
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
