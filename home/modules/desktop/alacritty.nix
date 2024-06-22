{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window = {
        padding = { x = 5; y = 5; };
        # full | none
        decorations = "full";

        # Background opacity [0,1]
        opacity = 0.8;

        # Windowed | Maximized | Fullscreen
        startup_mode = "Windowed";

        # Window title
        title = "Alacritty";

        # Allow terminal applications to change Alacritty's window title.
        dynamic_title = true;

        # Window class (Linux/BSD only):
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };

        # dark | light | None
        # gtk_theme_variant = "None";
      };
      scrolling = {
        # Maximum number of lines in the scrollback buffer.
        # Specifying '0' will disable scrolling.
        history = 10000;

        # Scrolling distance multiplier.
        multiplier = 3;
      };
      # Font configuration
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };
        size = 12.0;

        offset = {
          x = 0; # Modifies the letter spacing
          y = 0; # Modifies the line spacing
        };
      };
      colors.draw_bold_text_with_bright_colors = true;
      colors = {
        primary = {
          background = "#1d1f21";
          foreground = "#c5c8c6";
        };
        cursor = {
          text = "#1d1f21";
          cursor = "#c5c8c6";
        };
        selection = {
          text = "#1d1f21";
          cursor = "#c5c8c6";
        };
        normal = {
          black = "#1d1f21";
          red = "#cc6666";
          green = "#b5bd68";
          yellow = "#f0c674";
          blue = "#81a2be";
          magenta = "#b294bb";
          cyan = "#8abeb7";
          white = "#c5c8c6";
        };
        bright = {
          black = "#666666";
          red = "#d54e53";
          green = "#b9ca4a";
          yellow = "#e7c547";
          blue = "#7aa6da";
          magenta = "#c397d8";
          cyan = "#70c0b1";
          white = "#eaeaea";
        };
        dim = {
          black = "#131415";
          red = "#864343";
          green = "#777c44";
          yellow = "#9e824c";
          blue = "#556a7d";
          magenta = "#75617b";
          cyan = "#5b7d78";
          white = "#828482";
        };
      };
      bell = {
        # Ease | EaseOut | EaseOutSine | EaseOutQuad | EaseOutCubic | EaseOutQuart
        # EaseOutQuint | EaseOutExpo | EaseOutCirc | Linear
        animation = "EaseOutExpo";

        # Duration of the visual bell flash in milliseconds. A `duration` of `0` will
        # disable the visual bell animation.
        duration = 0;

        # Visual bell animation color.
        color = "#ffffff";

        command = "None";
      };
      selection.save_to_clipboard = true;
      # cursor.style = {
      #   # Cursor shape
      #   #
      #   # Values for `shape`:
      #   #   - ▇ Block
      #   #   - _ Underline
      #   #   - | Beam
      #   shape = "Block";
      #
      #   # Cursor blinking state
      #   #
      #   # Values for `blinking`:
      #   #   - Never: Prevent the cursor from ever blinking
      #   #   - Off: Disable blinking by default
      #   #   - On: Enable blinking by default
      #   #   - Always: Force the cursor to always blink
      #   blinking = "Off";
      #
      #   # Vi mode cursor style
      #   #
      #   # If the vi mode cursor style is `None` or not specified, it will fall back to
      #   # the style of the active value of the normal cursor.
      #   #
      #   # See `cursor.style` for available options.
      #   vi_mode_style = "None";
      #
      #   # Cursor blinking interval in milliseconds.
      #   blink_interval = 750;
      #
      #   # If this is `true`, the cursor will be rendered as a hollow box when the
      #   # window is not focused.
      #   #unfocused_hollow = true;
      #
      #   # Thickness of the cursor relative to the cell width as floating point number
      #   # from `0.0` to `1.0`.
      #   #thickness = 0.15;
      # };
      live_config_reload = true;
      working_directory = "None";
    };
  };
}
