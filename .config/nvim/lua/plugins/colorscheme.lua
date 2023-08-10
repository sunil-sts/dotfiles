return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    init = function()
      require("onedark").load()
    end,
    opts = {
      style = 'darker',
      transparent = 'true',
      lualine = {
        transparent = 'true',
      },
    }
  },
}
