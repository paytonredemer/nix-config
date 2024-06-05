# TODO: Add vim bindings and other nice to haves in zsh
let
  editor = "nvim";
in
{
  programs.zsh = {
    enable = true;
    zsh-abbr = {
      enable = true;
      abbreviations = {
        e = editor;
        v = editor;
        g = "git";
        h = "history";
      };
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

  };
}
