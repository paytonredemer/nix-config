{
  programs.zathura = {
    enable = true;
    mappings = {
      u = "scroll half-up";
      d = "scroll half-down";
      D = "toggle_page_mode";
      r = "reload";
      R = "rotate";
      K = "zoom in";
      J = "zoom out";
      H = "navigate previous";
      L = "navigate next";
      i = "recolor";
      p = "print";
      g = "goto top";
    };
    options = {
      adjust-open = "best-fit";
      sandbox = "none";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 1;
      selection-clipboard = "clipboard";
    };
  };
}
