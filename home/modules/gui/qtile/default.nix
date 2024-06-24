{ pkgs, ...}:

{
  # home.packages = [ pkgs.qtile ];

  xdg.configFile = {
    "qtile".source = ./qtile;
  };
}
