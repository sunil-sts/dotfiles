-- keymap helper

function Keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- find and replace on word under cursor
Keymap("n", "<leader>cs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Select (charwise) the contents of the current line, excluding indentation.
Keymap("n", "vv", "^vg_")

-- Select entire buffer
Keymap("n", "vaa", "ggvGg_")
Keymap("n", "Vaa", "ggVG")

-- Stay in indent mode.
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- Greatest keymap
Keymap("x", "<leader>p", "\"_dP")

-- Second greatest keymap ever
Keymap("n", "<leader>y", "\"+y")
Keymap("v", "<leader>y", "\"+y")

-- Eyy lmao
Keymap("i", "<C-c>", "<Esc>")

-- Elevate and write file
Keymap("n", "<leader>fw", "<cmd>w !sudo tee %<CR>")

-- Big ?
Keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Keymap("x", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
Keymap("x", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
Keymap("n", "<leader>j", "<cmd>m .+1<cr>==", { desc = "Move down" })
Keymap("n", "<leader>k", "<cmd>m .-2<cr>==", { desc = "Move up" })
Keymap("v", "<leader>j", ":m '>+1<cr>gv=gv", { desc = "Move down" })
Keymap("v", "<leader>k", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
Keymap("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
Keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
Keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
Keymap("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
Keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
Keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Clear search with <esc>
Keymap("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
Keymap("i", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Windows
-- Move to window using the <ctrl> hjkl keys
Keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window"})
Keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window"})
Keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window"})
Keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window"})

-- Resize window using <ctrl> arrow keys
Keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
Keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
Keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
Keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

Keymap("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
Keymap("n", "<leader>wb", "<C-W>s", { desc = "Split window below" })
Keymap("n", "<leader>wv", "<C-W>v", { desc = "Split window right" })

-- Tabbers

Keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
Keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
Keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
Keymap("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
Keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
Keymap("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Buffers

Keymap("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Prev buffer" })
Keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
Keymap("n", "[b", "<cmd>bprev<cr>", { desc = "Prev buffer" })
Keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
Keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
Keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep the cursor in place while joining lines.
Keymap("n", "J", "mzJ`z")

-- LSP
Keymap("n", "<leader>li", "<cmd>LspInfo<cr>")

-- Trouble
Keymap("n", "<leader>lR", "<cmd>TroubleToggle lsp_references<cr>")
Keymap("n", "<leader>ld", "<cmd>TroubleToggle<cr>")

-- vim.diagnostic
Keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
Keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")
Keymap("n", "<C-e>", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
Keymap("n", "<C-q>", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")

-- vim.lsp
Keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>")
Keymap("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")

-- vim.lsp.buf
Keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
Keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>")
Keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")

-- o - Options

Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>")
Keymap("n", "<leader>oo", "<cmd>only<cr>")

-- p - Package manager

Keymap("n", "<leader>ph", "<cmd>Lazy home<cr>")
Keymap("n", "<leader>pl", "<cmd>Lazy log<cr>")
Keymap("n", "<leader>pp", "<cmd>Lazy profile<cr>")
Keymap("n", "<leader>ps", "<cmd>Lazy sync<cr>")
Keymap("n", "<leader>pu", "<cmd>Lazy update<cr>")
Keymap("n", "<leader>pm", "<cmd>Mason<cr>", { desc = "Mason" })


-- Lazygit

local function lazygit()
  local gitpath = vim.b.git_dir
  local opts = {
    ft = "gitterm",
    size = { width = 0.9, height = 0.9 },
  }
  local float = require("lazy.util").float(opts)
  if gitpath then
    opts = vim.tbl_deep_extend("force", opts, { cwd = vim.env.HOME, })
    vim.fn.termopen("lazygit --git-dir=" .. gitpath, opts)
  else
    vim.fn.termopen("lazygit", opts)
  end
  vim.cmd.startinsert()
  vim.api.nvim_create_autocmd("TermClose", {
    once = true,
    buffer = float.buf,
    callback = function()
      float:close({ wipe = true })
      vim.cmd.checktime()
    end,
  })
end

vim.keymap.set("n", "<leader>gg", function() lazygit() end, { desc = "Lazygit (root dir)" })
