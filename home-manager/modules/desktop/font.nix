{lib, pkgs, ...}:

{
  # Enable fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    corefonts # Microsoft fonts
    noto-fonts-emoji
    source-han-code-jp
  ];

}
