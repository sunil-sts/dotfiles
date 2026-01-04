return {
  'chomosuke/typst-preview.nvim',
  -- lazy = false, -- or ft = 'typst'
  ft = 'typst',
  keys = {
    { mode = "n", buffer = 0, "<localleader>p", "<cmd>TypstPreviewToggle<CR>" }
  },
  version = '1.*',
  opts = {
    open_cmd = 'zen-browser --new-window %s' -- -P typst-preview --class typst-preview'
  },                                         -- lazy.nvim will implicitly calls `setup {}`
}
