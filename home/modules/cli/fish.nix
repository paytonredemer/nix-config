{lib, pkgs, ...}: let
  editor = "nvim";
in {
  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_greeting # disable fish greeting
      set -U fish_key_bindings fish_vi_key_bindings

      bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
      bind --mode insert \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'

      fish_add_path $HOME/.local/bin/
    '';
    shellAbbrs = {
      e = editor;
      v = editor;
      g = "git";
      h = "history";
    };
    shellAliases = {
      ls = "ls -hN --color=auto --group-directories-first";
      grep = "grep --color=auto";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      diff = "diff --color=auto";
      ":q" = "exit";
      ":wq" = "exit";
    };
    functions = {
      lfcd.body = ''
        set tmp (mktemp)
        # `command` is needed in case `lfcd` is aliased to `lf`
        command lf -last-dir-path=$tmp $argv
        if test -f "$tmp"
            set dir (cat $tmp)
            rm -f $tmp
            if test -d "$dir"
                if test "$dir" != (pwd)
                    cd $dir
                end
            end
        end
      '';

      # TODO: Move to yazi.nix
      yy.body = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
    plugins = [
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
  };
}
