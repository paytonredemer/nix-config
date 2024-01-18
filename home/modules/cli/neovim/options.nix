{
  programs.nixvim.options = {
    number = true;
    relativenumber = true;
    wrap = false;

    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    smartindent = true;

    swapfile = false;
    backup = false;

    hlsearch = false;
    incsearch = true;
    ignorecase = true;

    termguicolors = true;

    scrolloff = 8;
    signcolumn = "yes";

    colorcolumn = "80";

    # listchars = "{ eol = \"↵\", trail = \"~\", tab = \">-\", nbsp = \"␣\" }";
    list = true;
  };
}
