return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  branch = master,
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "zig",
      "rust",
    },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
}
