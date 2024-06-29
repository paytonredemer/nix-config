{ config, lib, ... }:
let
  cfg = config.modules.services.picom;
in
{
  options.modules.services.picom = {
    enable = lib.mkEnableOption "Enables picom";
  };

  # TODO: Customize picom more
  config = lib.mkIf cfg.enable { services.picom.enable = true; };
}
