return {
  {
    "folke/zen-mode.nvim",
  },

  {
    "nvim-neorg/neorg",
    dependencies = {
      { "nvim-neorg/neorg-telescope" },
    },
    event = { "BufEnter","BufReadPre", "BufNewFile" },
    build = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
      require("neorg").setup {
        -- configuration here
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              default_workspace = "personal",
              workspaces = {
                school = "~/notes/school",
                personal = "~/notes/personal",
              }
            }
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            }
          },
          ["core.concealer"] = {},
          ["core.export"] = {},
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode"
            }
          },
          ["core.summary"] = {},
          ["core.integrations.telescope"] = {},
        }
      }
    end,
  },
}
