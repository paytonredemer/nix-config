{ config, lib, ... }:
let
  cfg = config.cli.yazi;
in
{
  options = {
    cli.yazi.enable = lib.mkEnableOption "Enables yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
    };
    programs.fish = {
      functions.yy.body = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
      shellInit = ''
        bind \co 'set old_tty (stty -g); stty sane; yy; stty $old_tty; commandline -f repaint'
        bind --mode insert \co 'set old_tty (stty -g); stty sane; yy; stty $old_tty; commandline -f repaint'
      '';
    };

    programs.bash.bashrcExtra = ''
      function yy() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
              cd -- "$cwd"
          fi
          rm -f -- "$tmp"
      }
      bind '"\C-o":"yy\C-m"'
    '';
  };
}
