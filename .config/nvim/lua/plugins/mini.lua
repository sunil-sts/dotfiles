return {
  {
    'echasnovski/mini.nvim',
    version = false,
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    keys = {
      { "<leader>tw", mode = "n", "<cmd>lua MiniTrailspace.trim()<CR>" },
      -- { "<leader>nh", mode = "n", "<cmd>lua MiniNotify.show_history()<CR>" },
    },
    config = function()
      -- require('mini.statusline').setup()
      require('mini.surround').setup()
      require('mini.splitjoin').setup()
      -- local gen_loader = require('mini.snippets').gen_loader
      -- require('mini.snippets').setup({
      --   snippets = {
      --     -- Load custom file with global snippets first (adjust for Windows)
      --     gen_loader.from_file('~/.config/nvim/snippets/global.json'),
      --
      --     -- Load snippets based on current language by reading files from
      --     -- "snippets/" subdirectories from 'runtimepath' directories.
      --     gen_loader.from_lang(),
      --   },
      -- })
      require("mini.pairs").setup()
      require("mini.operators").setup({
        replace = {
          prefix = 'gR',
        },
      })
      -- require("mini.comment").setup()
      require("mini.align").setup()
      require("mini.ai").setup()
      -- require("mini.icons").setup()
      require("mini.hipatterns").setup()
      require("mini.trailspace").setup()
      require("mini.notify").setup()
    end,
  },

}
