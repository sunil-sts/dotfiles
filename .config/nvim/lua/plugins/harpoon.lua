return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  keys = {
    {mode = "n", "<leader>ha", function () require("harpoon"):list():add() end},
    {mode = "n", "<leader>he", function () require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end},

    {mode = "n", "<leader>1", function () require("harpoon"):list():select(1) end},
    {mode = "n", "<leader>2", function () require("harpoon"):list():select(2) end},
    {mode = "n", "<leader>3", function () require("harpoon"):list():select(3) end},
    {mode = "n", "<leader>4", function () require("harpoon"):list():select(4) end},
    {mode = "n", "<leader>5", function () require("harpoon"):list():select(5) end},

    -- TODO maybe fix
    -- {mode = "n", "]h", function () require("harpoon"):list():next() end},
    -- {mode = "n", "[h", function () require("harpoon"):list():prev() end},
  },
}
