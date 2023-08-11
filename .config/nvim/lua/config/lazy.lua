require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins/lsp/lang" },
  },

  defaults = {
    lazy = true,
    version = false,
  },

  install = { colorscheme = { "tokyonight" } },

  checker = { enabled = true },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

