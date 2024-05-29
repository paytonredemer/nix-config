return {
  "nvim-orgmode/orgmode",
  dependencies = {
    { "nvim-orgmode/org-bullets.nvim", opts = {} },
    { "dhruvasagar/vim-table-mode" },
  },
  event = "VeryLazy",
  ft = { "org" },
  opts = {
    org_agenda_files = "~/Documents/org/**/*",
    org_default_notes_file = "~/Documents/org/refile.org",
  },
}
