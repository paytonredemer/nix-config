{
  imports = [
    # ./alacritty.nix
    ./font.nix
    ./qtile
    ./dunst.nix
    ./rofi.nix
    ./zathura.nix
    ./firefox.nix
  ];

  services.picom.enable = true;
}
