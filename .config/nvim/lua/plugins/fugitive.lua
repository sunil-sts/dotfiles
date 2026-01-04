return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gg", mode = "n", "<cmd>Git<CR>" },
    { "<leader>gd", mode = "n", "<cmd>Git difftool<CR>" },
    -- { "<leader>ga", mode = "n", "<cmd>Git add %<CR>" },
    { "<leader>gr", mode = "n", "<cmd>Git rebase -i<CR>" },
    { "<leader>gm", mode = "n", "<cmd>Git mergetool<CR>" },
    { "<leader>gcc", mode = "n", "<cmd>Git commit<CR>" },
    { "<leader>gbm", mode = "n", "<cmd>Git blame<CR>" },
  },
}
