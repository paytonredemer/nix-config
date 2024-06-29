{ config, lib, ... }:
let
  cfg = config.modules.editor;
in
{
    imports = [
      ./neovim
      ./nixvim
    ];

  options.modules.editor = {
    enable = lib.mkEnableOption "Enables editors";
  };

  config = lib.mkIf cfg.enable {
    modules.editor = {
      neovim.enable = lib.mkDefault true;
      nixvim.enable = lib.mkDefault false;
    };
  };
}
