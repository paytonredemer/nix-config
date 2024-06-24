{ config, lib, ... }:
let
  cfg = config.cli.zoxide;
in
{
  options = {
    cli.zoxide.enable = lib.mkEnableOption "Enables zoxide";
  };

  config = lib.mkIf cfg.enable { programs.zoxide.enable = true; };
}
