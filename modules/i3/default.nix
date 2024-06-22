{
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
    configFile = ./config;
  };
}
