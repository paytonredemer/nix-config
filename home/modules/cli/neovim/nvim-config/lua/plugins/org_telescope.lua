return {
  "nvim-orgmode/telescope-orgmode.nvim",
  dependencies = {
    "nvim-orgmode/orgmode",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("orgmode")
  end,
  keys = {
    {
      "<leader>or",
      function()
        require("telescope").extensions.orgmode.refile_heading()
      end,
      desc = "[O]rg [R]efile heading",
    },
    {
      "<leader>oh",
      function()
        require("telescope").extensions.orgmode.search_headings()
      end,
      desc = "[O]rg search [H]eadings",
    },
    {
      "<leader>ol",
      function()
        require("telescope").extensions.orgmode.insert_link()
      end,
      desc = "[O]rg insert [L]ink",
    },
  },
}
