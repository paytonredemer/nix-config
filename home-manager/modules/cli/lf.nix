{
  programs.lf = {
    enable = true;
    commands = {
      # Don't use extraConfig
    };
    keybindings = {
      x = "$$f";
      X = "!$f";
    };
    settings = {
      hidden = true;
      icons = true;
      number = true;
      relativenumber = true;
      scrolloff = 10;
    };
    extraConfig = ''
      cmd open ''${{
          case $(file --mime-type $f -b) in
              text/*) $EDITOR $fx;;
              *) for f in $fx; do setsid $OPENER $f > /dev/null 2> /dev/null & done;;
          esac
      }}
    '';
  };
}
