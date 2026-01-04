return {
  "stevearc/oil.nvim",
  lazy = false,

  keys = {
    {"<leader>ee", "<cmd>Oil<CR>"}
  },
  
  opts = {
    -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
    -- Additionally, if it is a string that matches "actions.<name>",
    -- it will use the mapping at require("oil.actions").<name>
    -- Set to `false` to remove a keymap
    -- See :help oil-actions for a list of all available actions
    keymaps = {
      ["<C-p>"] = { "actions.preview", opts = { vertical = true, split = "botright"} },
      ["g."] = { "actions.cd", mode = "n" },
    },
    -- Set to false to disable all of the above keymaps
    use_default_keymaps = true,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    float = {
      preview_split = "left",
    },
    -- Configuration for the file preview window
    preview_win = {
      -- Whether the preview window is automatically updated when the cursor is moved
      update_on_cursor_moved = true,
      -- How to open the preview window "load"|"scratch"|"fast_scratch"
      preview_method = "fast_scratch",
      -- A function that returns true to disable preview on a file e.g. to avoid lag
      disable_preview = function(filename)
        return false
      end,
      -- Window-local options to use for preview window buffers
      win_options = {},
    },
  }
}
