-- Clear search with <esc>
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set("i", "<esc>", "<cmd>noh<cr><esc>")

vim.keymap.set("n", "<leader>tt", "<cmd>Toggleterm<cr>")
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-N>")

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>")
vim.keymap.set("v", "<leader>x", "<cmd>lua<CR>")

vim.keymap.set("n", "<C-j>", "<C-w>w")
vim.keymap.set("n", "<C-k>", "<C-w>W")
vim.keymap.set("n", "<c-w>F", "<c-w>f")
vim.keymap.set("n", "<C-w>f", "<cmd>ToggleFullscreen<cr>", { noremap = true })

vim.keymap.set("n", "<c-l>", "<c-w>gt")
vim.keymap.set("n", "<c-h>", "<c-w>gT")
vim.keymap.set("n", "<c-w>t", "<cmd>tabnew<cr>")

-- Compmode
vim.keymap.set("n", "<leader>cc", "<cmd>CompModeSet<cr>")
vim.keymap.set("n", "<leader>cr", "<cmd>CompModeRecompile<cr>")
vim.keymap.set("n", "<leader>ct", "<cmd>CompModeToggle<cr>")
