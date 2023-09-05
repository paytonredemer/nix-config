{ lib, config, pkgs, inputs, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
    set -U fish_greeting # disable fish greeting
    set -U fish_key_bindings fish_vi_key_bindings

    fish_add_path $HOME/.local/bin/
    '';
    shellAbbrs = {
      e = "$EDITOR";
      v = "$EDITOR";
      g = "git";
    };
    shellAliases = {
      ls = "ls -hN --color=auto --group-directories-first";
      grep = "grep --color=auto";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      ":q" = "exit";
      ":wq" = "exit";
    };
    plugins = [
      { name = "z"; src = pkgs.fishPlugins.z.src; }
    ];
  };

  # programs.starship = {
  #   enable = false;
  #   # enableBashIntegration = true;
  #   # enableFishIntegration = true;
  #   settings = {
  #     username = {
  #       format = "user: [$user]($style) ";
  #       show_always = true;
  #     };
  #   };
  # };
}
