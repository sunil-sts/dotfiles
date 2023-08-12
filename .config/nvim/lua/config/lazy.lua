require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins/lsp/lang" },
  },

  defaults = {
    lazy = true,
    version = false,
  },

  change_detection = {
    enabled = false,
  },

  install = {
    colorscheme = { "onedark" },
  },

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

