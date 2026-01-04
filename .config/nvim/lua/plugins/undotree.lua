return {
  'mbbill/undotree',
  init = function()
    vim.g.undotree_DiffAutoOpen = 0
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
  keys = {
    { "<leader>u", function() vim.cmd.UndotreeToggle(); end, desc = "Toggle Undotree" }
  },
}
