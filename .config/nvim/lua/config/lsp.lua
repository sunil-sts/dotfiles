vim.lsp.enable({
  "lua_ls",
  "tinymist",
  "zls",
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
