-- Create autogroup.

local function augroup(name)
  return vim.api.nvim_create_augroup("sunil_" .. name, { clear = true })
end

-- KDL comment string
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("kdl"),
  pattern = { "kdl" },
  callback = function()
    vim.cmd([[setlocal commentstring=//\ %s]])
  end,
})


-- Format options
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Add these options.
    vim.cmd([[ setlocal formatoptions+=c ]]) -- Autowrap comments
    vim.cmd([[ setlocal formatoptions+=j ]]) -- Join comment lines when possible
    vim.cmd([[ setlocal formatoptions+=n ]]) -- Format recognizing numbered lists
    vim.cmd([[ setlocal formatoptions+=q ]]) -- Allow format with gq
    vim.cmd([[ setlocal formatoptions+=r ]]) -- Insert autocomment leader

    -- Remove these options.
    vim.cmd([[ setlocal formatoptions-=2 ]]) -- Use 2nd line indent when formatting
    vim.cmd([[ setlocal formatoptions-=a ]]) -- Automatic paragraph formatting
    vim.cmd([[ setlocal formatoptions-=o ]]) -- Automatic insert comment leader when 'o' or 'O'
    vim.cmd([[ setlocal formatoptions-=t ]]) -- Auto wrap with text width
  end,
})

-- Set spelling for some file types.

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Set gitdir for dotfiles repo.
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*/.config/*", },
  callback = function()
    vim.b.git_dir = vim.env.HOME .. "/personal/dotfiles.git"
    vim.keymap.set(
      'n',
      '<leader>gcs',
      function()require("telescope.builtin").git_commits(
        {
          git_command = {
            "git",
            "log",
            "--git-dir='$HOME/personal/dotfiles.git'",
            "--work-tree='$HOME'",
            "--pretty=oneline",
            "--abbrev-commit",
            "--",
            "."
          },
        },
        { buffer = 0 }
      )end
    )
  end,
})
