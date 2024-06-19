{
  imports = [
    ./alacritty.nix
    ./font.nix
    ./qtile
    ./dunst.nix
    ./rofi.nix
    ./zathura.nix
    ./firefox.nix
    ./wezterm
  ];

  services.picom.enable = true;
}
