{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#dcd7ba";
        separator_color = "#dcd7ba";
      };
      base16_low = {
          msg_urgency = "low";
          background = "#16161d";
          foreground = "#54546d";
      };
      base16_normal = {
          msg_urgency = "normal";
          background = "#223249";
          foreground = "#dcd7ba";
      };
      base16_critical = {
          msg_urgency = "critical";
          background = "#c34043";
          foreground = "#c8c093";
      };
    };
  };
}
