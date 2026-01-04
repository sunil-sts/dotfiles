return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = {
          theme = "ivy"
        },
        help_tags = {
          theme = "ivy"
        },
        buffers = {
          theme = "ivy"
        },
        live_grep = {
          theme = "ivy"
        },
        man_pages = {
          theme = "ivy"
        },
        quickfix = {
          theme = "ivy"
        },
        lsp_references = {
          theme = "ivy"
        },
        lsp_document_symbols = {
          theme = "ivy"
        },
        lsp_workspace_symbols = {
          theme = "ivy"
        },
        diagnostics = {
          theme = "ivy"
        },
        git_commits = {
          theme = "ivy"
        },
        git_branches = {
          theme = "ivy"
        },
        keymaps = {
          theme = "ivy"
        },
      },

      extensions = {
        fzf = {}
      }
    }

    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fa', function()
      builtin.find_files { cwd = "~" }
    end)
    vim.keymap.set('n', '<leader>fp', function()
      builtin.find_files { cwd = "~/personal" }
    end)
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = "~/notes" }
    end)
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep)
    vim.keymap.set('n', '<leader>fg', function()
      require("telescope-custom.pickers").live_multigrep()
    end)
    vim.keymap.set('n', '<leader>fb', builtin.buffers)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    vim.keymap.set('n', '<leader>fm', builtin.man_pages)
    vim.keymap.set('n', '<leader>fq', builtin.quickfix)
    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)

    vim.keymap.set('n', '<leader>fk', builtin.keymaps)

    vim.keymap.set('n', 'grr', builtin.lsp_references)
    vim.keymap.set('n', 'go', builtin.lsp_document_symbols)
    vim.keymap.set('n', 'gO', builtin.lsp_workspace_symbols)
    vim.keymap.set('n', '<leader>dd', builtin.diagnostics)
  end
}
