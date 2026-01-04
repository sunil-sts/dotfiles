-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "sunil" -- Name of your colorscheme

-- Define your palette
local colors = {
  bg       = '#141414',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}
-- local colors = {
--   bg = "#1e1e2e",
--   fg = "#cdd6f4",
--   red = "#f38ba8",
--   green = "#a6e3a1",
--   yellow = "#f9e2af",
--   blue = "#89b4fa",
--   magenta = "#cba6f7",
--   cyan = "#94e2d5",
--   gray = "#585b70",
-- }

-- Helper function to set highlights
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- UI elements
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("CursorLine", { bg = "#313244" })
hi("CursorLineNr", { fg = colors.yellow, bold = true })
hi("LineNr", { fg = colors.gray })
hi("Visual", { bg = "#45475a" })
hi("Search", { fg = colors.bg, bg = colors.yellow, bold = true })
hi("IncSearch", { fg = colors.bg, bg = colors.orange, bold = true })

-- Syntax groups
hi("Comment", { fg = colors.gray, italic = true })
hi("Constant", { fg = colors.cyan })
hi("String", { fg = colors.green })
hi("Identifier", { fg = colors.blue })
hi("Function", { fg = colors.blue, bold = true })
hi("Statement", { fg = colors.magenta })
hi("Keyword", { fg = colors.red, italic = true })
hi("Type", { fg = colors.yellow })
hi("Number", { fg = colors.orange })
hi("Boolean", { fg = colors.orange })

-- Diagnostics
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.cyan })
