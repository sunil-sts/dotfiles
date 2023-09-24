return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
    cmd = { "TSUpdateSync" },
    keys = {
      { "<space><space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ensure_installed = {
        "bash",
        "c",
        "go",
        "haskell",
        "lua",
        "markdown",
        "rust",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<space><space>",
          node_incremental = "<space><space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        swap = {
          enable = true,
          swap_next = {
            ["<leader>]a"] = "@parameter.inner",
            ["<leader>]m"] = "@function.outer",
          },
          swap_previous = {
            ["<leader>[a"] = "@parameter.inner",
            ["<leader>[m"] = "@function.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]a"] = "@parameter.inner",
            ["]A"] = "@parameter.outer",
            ["]c"] = "@conditional.outer",
            ["]C"] = "@conditional.inner",
            ["]m"] = "@function.outer",
            ["]M"] = "@function.inner",
            ["]o"] = "@loop.*",
          },
          goto_previous_start = {
            ["[a"] = "@parameter.inner",
            ["[A"] = "@parameter.outer",
            ["[c"] = "@conditional.outer",
            ["[C"] = "@conditional.inner",
            ["[m"] = "@function.outer",
            ["[M"] = "@function.inner",
            ["[o"] = "@loop.*",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

