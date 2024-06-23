{ pkgs, lib, ... }:
{
  imports = [
    ./i3status.nix
  ];

  # TODO: This should probably go in its own file
  home.packages = with pkgs; [
    # Script to control to laptop backlight and display notification with new brightness percentage
    (writeShellApplication {
      name = "brightness-ctl";
      runtimeInputs = with pkgs; [
        brightnessctl
        gawk
        libnotify
      ];
      text = ''

        case $1 in
            up)
                brightnessctl set +5%
                ;;
            down)
                brightnessctl set 5%-
                ;;
        esac

        brightness=$(awk "BEGIN {print $(brightnessctl get) / $(brightnessctl max) * 100}")

        notify-send -t 1000 -r 100 "   Brightness" "$brightness%"
      '';
    })
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      floating.modifier = "${modifier}";

      gaps = {
        smartBorders = "on";
        inner = 12;
        outer = 0;
      };
      # TODO:Add fonts?
      # fonts = {
      #   names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
      #   style = "Bold Semi-Condensed";
      #   size = 11.0;
      # };

      window.border = 2;

      bars = [
        {
          fonts = {
            names = [ "FiraCode Nerd Font Mono" ];
            size = 11.0;
          };
          statusCommand = "i3status-rs $HOME/.config/i3status-rust/config-top.toml";
          position = "top";
          mode = "dock";
          # modifier is not a real option?
          # modifier = "none";
          trayOutput = "primary";
        }
      ];

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec --no-startup-id $TERMINAL";
        "${modifier}+w" = "exec --no-startup-id $BROWSER";
        "${modifier}+p" = "exec --no-startup-id 'rofi -combi-modi drun,window,ssh -show combi'";
        "${modifier}+Shift+p" = "exec --no-startup-id 'rofi-rbw'";
        "${modifier}+z" = "exec --no-startup-id 'flameshot gui'";

        "${modifier}+equal" = "exec --no-startup-id 'volume-ctl up'";
        "${modifier}+minus" = "exec --no-startup-id 'volume-ctl down'";

        "XF86AudioRaiseVolume" = "exec --no-startup-id 'volume-ctl up'";
        "XF86AudioLowerVolume" = "exec --no-startup-id 'volume-ctl down'";
        "XF86AudioMute" = "exec --no-startup-id 'volume-ctl mute'";
        "XF86AudioMicMute" = "exec --no-startup-id 'volume-ctl mute-input'";

        "XF86MonBrightnessDown" = "exec --no-startup-id 'brightness-ctl down'";
        "XF86MonBrightnessUp" = "exec --no-startup-id 'brightness-ctl up'";

        "${modifier}+control+p" = "exec --no-startup-id 'playerctl play-pause'";
        "${modifier}+control+comma" = "exec --no-startup-id 'playerctl previous'";
        "${modifier}+control+period" = "exec --no-startup-id 'playerctl next'";

        "${modifier}+Shift+r" = "move scratchpad";
        "${modifier}+r" = "scratchpad show";
        "${modifier}+s" = "sticky toggle";

        "${modifier}+q" = "kill";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+Shift+BackSpace" = "exit";

        # layouts
        "${modifier}+t" = "split toggle";
        "${modifier}+v" = "split vertical";
        "${modifier}+Shift+v" = "split horizontal";
        "${modifier}+Shift+d" = "layout default";
        "${modifier}+Shift+s" = "layout stacking";
        "${modifier}+Shift+t" = "layout tabbed";

        # toggle tiling / floating
        "${modifier}+space" = "focus mode_toggle";
        "${modifier}+Shift+space" = "floating toggle";

        "${modifier}+a" = "focus parent";
        "${modifier}+c" = "focus child";

        # reload the configuration file
        "${modifier}+Control+r" = "reload";
        "${modifier}+b" = "bar mode toggle";

        # gaps
        # "${modifier}+g" = "gaps inner current toggle ${gaps.inner}; gaps outer current toggle ${gaps.outer}";
        # "${modifier}+Shift+g" = "gaps inner current set ${gaps.inner}; gaps outer current set ${gaps.outer}";
        "${modifier}+Shift+plus" = "gaps inner current minus 5";
        "${modifier}+Shift+minus" = "gaps inner current plus 5";

        # resize
        "${modifier}+Control+h" = "exec --no-startup-id i3resize left";
        "${modifier}+Control+j" = "exec --no-startup-id i3resize down";
        "${modifier}+Control+k" = "exec --no-startup-id i3resize up";
        "${modifier}+Control+l" = "exec --no-startup-id i3resize right";

        # --- Change focus and move window --- #

        # change focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";

        # move focused window
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        # multi monitor
        "${modifier}+comma" = "focus output left";
        "${modifier}+period" = "focus output right";
        "${modifier}+Shift+comma" = "move output left";
        "${modifier}+Shift+period" = "move output right";
        "${modifier}+Shift+m" = "move output next";

        # switch to workspace
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        # move focused container to workspace
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

      };
    };
  };

  # programs.i3status-rust = {
  #   enable = true;
  #   bars = {
  #     top = {
  #       blocks = [
  #
  #       ];
  #     };
  #   };
  # };
}
