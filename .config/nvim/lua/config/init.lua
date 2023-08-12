if vim.fn.argc() == 1 then
  local stat = vim.loop.fs_stat(vim.fn.argv(0))
  if stat and stat.type == "directory" then
    vim.cmd([[cd %]])
  elseif stat then
    vim.cmd([[cd %:h]])
  end
end

require("config.options")
require("config.autocmds")
require("config.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

