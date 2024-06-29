-- TODO: Lazy load and update bookmarks to be more useful
return {
  "lalitmee/browse.nvim",
  enabled = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    bookmarks = {
      "https://github.com/search?q=%s&type=code",
      "https://github.com/search?q=%s&type=repositories",
      "https://github.com/hoob3rt/lualine.nvim",
      "https://github.com/neovim/neovim",
      "https://neovim.discourse.group/",
      "https://github.com/nvim-telescope/telescope.nvim",
      "https://github.com/rockerBOO/awesome-neovim",
    },
  },
}
