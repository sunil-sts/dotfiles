-- Create autogroup.

local function augroup(name)
  return vim.api.nvim_create_augroup("sunil_" .. name, { clear = true })
end

-- Netrw keymaps
vim.api.nvim_create_autocmd("filetype", {
  pattern = { "netrw" },
  callback = function ()
    local key = function (lhs, rhs)
      vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
    end
    key("H", "u")
    key("h", "-^")
    key("l", "<cr>")
    --Mark
    key("<tab>", "mf")
    key("<s-tab>", "mF")
    key("<Leader><tab>", "mu")
    --File actions
    key("n", "%<cmd>w<cr><cmd>Explore<cr>")
    key("r", "R")
    key("c", "mc")
    key("C", "mtmc")
    key("m", "mm")
    key("M", "mtmm")
  end
})

-- Transparency

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("transparency"),
  callback = function()
    vim.cmd([[ highlight clear Folded ]])
    vim.cmd([[ highlight Folded guibg=comment ]])

    vim.cmd([[ highlight clear CursorLineFold ]])
    vim.cmd([[ highlight CursorLineFold guifg=#e0af68 ]])

    vim.cmd([[ highlight ColorColumn guibg=#202031 ]])

    vim.cmd([[ highlight LineNr guifg=#a020f0 ]])
    vim.cmd([[ highlight LineNrAbove guifg=#787c99 ]])
    vim.cmd([[ highlight LineNrBelow guifg=#787c99 ]])
    vim.cmd([[ highlight clear SignColumn ]])
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

-- go to last loc when opening a buffer

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Set gitdir for dotfiles repo.
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*/.config/*", },
  callback = function()
    vim.b.git_dir = vim.env.HOME .. "/personal/dotfiles.git"
  end,
})

