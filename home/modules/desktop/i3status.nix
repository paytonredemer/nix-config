{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "sound";
            # theme_overrides = {
            #   idle_bg = "#00223f";
            # };
          }
          {
            block = "battery";
            device = "BAT0";
            format = " $icon $percentage $time ";
          }
          {
            block = "net";
            format = " $icon $ssid $signal_strength $ip";
            interval = 2;
            # theme_overrides = {
            #   idle_bg = "#00223f";
            # };
          }
          {
            block = "time";
            interval = 1;
            format = " $timestamp.datetime(f:'%a, %b %d %I:%M:%S %p') ";
          }
        ];
        theme = "plain";
        icons = "none";
      };
    };
  };
}
