{ config, lib, ... }:
let
  cfg = config.modules.shell.zoxide;
in
{
  options = {
    modules.shell.zoxide.enable = lib.mkEnableOption "Enables zoxide";
  };

  config = lib.mkIf cfg.enable { programs.zoxide.enable = true; };
}
