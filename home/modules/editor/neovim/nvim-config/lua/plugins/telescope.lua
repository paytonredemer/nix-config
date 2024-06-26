return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  cmd = "Telescope",
  opts = function()
    local actions = require("telescope.actions")
    local lga_actions = require("telescope-live-grep-args.actions")
    return {
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-space>"] = actions.to_fuzzy_refine,
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)

    pcall(require("telescope").load_extension("fzf"))
    require("telescope").load_extension("live_grep_args")
  end,
  keys = {
    { "<leader>:",        "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = true,
        }))
      end,
      desc = "[/] Fuzzily search in current buffer",
    },
    { "<leader><leader>", "<cmd>Telescope buffers<cr>",                   desc = "Open Buffers" },
    { "<C-p>",            "<cmd>Telescope git_files<cr>",                 desc = "[P]roject files" },
    -- find
    { "<leader>fb",       "<cmd>Telescope buffers<cr>",                   desc = "[F]ind [B]uffers" },
    { "<leader>ff",       "<cmd>Telescope find_files<cr>",                desc = "[F]ind [F]iles" },
    { "<leader>fp",       "<cmd>Telescope git_files<cr>",                 desc = "[F]ind [P]roject files" },
    { "<leader>fr",       "<cmd>Telescope oldfiles<cr>",                  desc = "[F]ind [R]ecent files" },
    -- search
    { "<leader>sa",       "<cmd>Telescope autocommands<cr>",              desc = "[S]earch [A]uto commands" },
    { "<leader>sb",       "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[S]earch [B]uffers" },
    { "<leader>sc",       "<cmd>Telescope commands<cr>",                  desc = "[S]earch [C]ommands" },
    { "<leader>sd",       "<cmd>Telescope diagnostics bufnr=0<cr>",       desc = "[S]earch document [D]iagnostics" },
    { "<leader>sD",       "<cmd>Telescope diagnostics<cr>",               desc = "[S]earch workspace [D]iagnostics" },
    {
      "<leader>sg",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
      desc = "[S]earch [G]rep",
    },
    { "<leader>sG", "<cmd>Telescope grep_string<cr>", desc = "[S]earch [G]rep string" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",   desc = "[S]earch [H]elp" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>",  desc = "[S]earch [H]ighlight groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",     desc = "[S]earch [K]eymaps" },
    { "<leader>sm", "<cmd>Telescope marks<cr>",       desc = "[S]earch [M]arks" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>",   desc = "[S]earch [M]an pages" },
    {
      "<leader>sn",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "[S]earch [N]eovim files",
    },
    { "<leader>so", "<cmd>Telescope vim_options<cr>",          desc = "[S]earch [O]ptions" },
    { "<leader>sr", "<cmd>Telescope resume<cr>",               desc = "[S]earch [R]esume" },
    { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "[S]earch document [S]ymbols" },
    {
      "<leader>sw",
      function()
        require("telescope.builtin").grep_string({
          grep_open_files = true,
        })
      end,
      desc = "[S]earch [W]ord in Open Files",
    },
    {
      "<leader>s/",
      function()
        require("telescope.builtin").live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end,
      desc = "[S]earch [/] in Open Files",
    },
    -- git
    { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "[G]it [B]ranches" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>",  desc = "[G]it [C]ommits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>",   desc = "[G]it [S]tatus" },
    -- ui
    { "<leader>uc", "<cmd>Telescope colorscheme<CR>",  desc = "[U]i [C]olorscheme" },
  },
}
