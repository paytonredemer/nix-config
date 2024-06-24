# TODO: This doesn't work...
{ config, lib, ... }:
let
  cfg = config.cli.nixvim;
in
{

  options = {
    cli.nixvim.enable = lib.mkEnableOption "Enables nixvim";
  };

  # imports = [
  #   ./plugins
  #   ./keymaps.nix
  #   ./options.nix
  # ];

  config = lib.mkIf cfg.enable {
    # programs.nixvim = {
    #   enable = true;
    #   colorschemes.kanagawa.enable = true;
    # };
  };
}
