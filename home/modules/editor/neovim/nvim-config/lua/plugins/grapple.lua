return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git_branch", -- also try out "git_branch"
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
    { "<leader>k", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple toggle tags" },
    { "<leader>K", "<cmd>Grapple toggle_scopes<cr>", desc = "Grapple toggle scopes" },
    { "<leader>j", "<cmd>Grapple cycle forward<cr>", desc = "Grapple cycle forward" },
    { "<leader>J", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
    { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
    { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
    { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
    { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
    { "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Grapple select 5" },
    { "<leader>6", "<cmd>Grapple select index=6<cr>", desc = "Grapple select 6" },
    { "<leader>7", "<cmd>Grapple select index=7<cr>", desc = "Grapple select 7" },
    { "<leader>8", "<cmd>Grapple select index=8<cr>", desc = "Grapple select 8" },
    { "<leader>9", "<cmd>Grapple select index=9<cr>", desc = "Grapple select 9" },
    { "<leader>0", "<cmd>Grapple select index=10<cr>", desc = "Grapple select 10" },
  },
}
