-- {{{ Alphabetical listing of settings.

local options = {
  backup = false,
  breakindent = true,
  colorcolumn = "+1",
  complete = { ".", "w", "b", "u", "t", "i", "kspell" },
  completeopt = { "menuone", "noinsert", "noselect" },
  cursorline = false,
  expandtab = true,
  fillchars = { fold = " ", eob = " " },
  -- foldlevel = 0,
  -- foldmethod = "marker",
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  hidden = true,
  -- hlsearch = false,
  ignorecase = true,
  incsearch = true,
  laststatus = 0,
  list = true,
  listchars = { trail = "." },
  mouse = "a",
  nrformats = { "alpha", "octal", "hex", "bin" },
  number = true,
  numberwidth = 4,
  relativenumber = true,
  scrolloff = 8,
  shiftround = true,
  shiftwidth = 2,
  shortmess = "aToO",
  showmode = false,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  textwidth = 80,
  timeoutlen = 750,
  undodir = os.getenv("HOME") .. "/.local/share/vim/undodir",
  undofile = true,
  undolevels = 10000,
  updatetime = 250,
  wildmode = { "longest:full" },
  wrap = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[filetype plugin indent on]])
vim.opt.isfname:append("@-@")


-- ------------------------------------------------------------------------- }}}
-- {{{ Bullets

vim.g.bullets_enabled_file_types = {
  "gitcommit",
  "markdown",
  "scratch",
  "text",
}

-- ------------------------------------------------------------------------- }}}

