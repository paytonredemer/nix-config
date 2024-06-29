{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.themes.font;
in
{
  options.modules.themes.font = {
    enable = lib.mkEnableOption "Enables fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;

    # TODO: Replace and put in Nix module (font.package)
    home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      corefonts # Microsoft fonts
      noto-fonts-emoji
      source-han-code-jp
    ];
  };
}
