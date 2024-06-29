{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      # move to windows using one less key stroke
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }

      # move text up and down
      { mode = "v"; key = "J"; action = ":m '>+1<CR>gv=gv"; }
      { mode = "v"; key = "K"; action = ":m '<-2<CR>gv=gv"; }

      { mode = "n"; key = "L"; action = "$"; }

      # centered actions
      { mode = "n"; key = "<C-d>"; action = "<C-d>zz"; }
      { mode = "n"; key = "<C-u>"; action = "<C-u>zz"; }
      { mode = "n"; key = "n"; action = "nzzzv"; }
      { mode = "n"; key = "N"; action = "Nzzzv"; }

      # tab navigation
      { mode = "n"; key = "<Tab>"; action = ":tabnext<cr>"; }
      { mode = "n"; key = "<S-Tab>"; action = ":tabprevious<cr>"; }

      # better macros
      { mode = "n"; key = "Q"; action = "@q"; }
      { mode = "x"; key = "Q"; action = ":norm @q<CR>"; }

      # yanking and deleting
      { mode = [ "n" "v" ]; key = "<leader>y"; action = "\"+y"; }
      { mode = "n"; key = "<leader>Y"; action = "\"+Y"; }
      { mode = [ "n" "v" ]; key = "<leader>d"; action = "\"_d"; }
    ];
  };
}
