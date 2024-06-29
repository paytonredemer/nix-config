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
    org_capture_templates = {
      t = {
        description = "General TODO",
        template = "* TODO %?",
      },
      p = {
        description = "Personal TODO",
        template = "* TODO %?\nDEADLINE: %^T",
        target = "~/Documents/org/personal/refile.org",
      },
      f = {
        description = "Fun tech TODO",
        template = "* TODO [#C] %?",
        target = "~/Documents/org/personal/tech.org",
      },
      w = {
        description = "Work TODO",
        template = "* TODO [#B] %?\nDEADLINE: %^T",
        target = "~/Documents/org/work/refile.org",
      },
      T = {
        description = "Ticket",
        template =
        "** TODO [#C] %?\nDEADLINE: %^t\n  :PROPERTIES:\n  :CREATED: %U\n  :JIRA: [[][JIRA-XXXX]]\n  :PRODUCT:\n  :FEATURES:\n  :PATCH:\n  :END:\n\n*** Notes\n*** Time",
        target = "~/Documents/org/work/tickets.org",
        -- headline = "Current Tickets",
      },
      c = {
        description = "Code Snippet",
        template = "- %?\n  - %a",
        target = "~/Documents/org/work/code.org",
        headline = "Refile",
      },
    },
  },
}
