local colors = {
  bg       = '#202328',
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

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = {
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
      icons_enabled = true,
      component_separators = '',
      section_separators = '',
      ignore_focus = {},
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},

      lualine_c = {
        {
          function()
            return '▊'
          end,
          color = function()
            local mode_color = {
              n = colors.red,
              i = colors.green,
              v = colors.blue,
              [''] = colors.blue,
              V = colors.blue,
              c = colors.magenta,
              no = colors.red,
              s = colors.orange,
              S = colors.orange,
              [''] = colors.orange,
              ic = colors.yellow,
              R = colors.violet,
              Rv = colors.violet,
              cv = colors.red,
              ce = colors.red,
              r = colors.cyan,
              rm = colors.cyan,
              ['r?'] = colors.cyan,
              ['!'] = colors.red,
              t = colors.red,
            }
            return { fg = mode_color[vim.fn.mode()] }
          end,
          padding = { left = 0, right = 1 },
        },
        { 'filesize', },
        { 'filename', color = { fg = colors.magenta, gui = 'bold' }, },
        { 'location', },
        { 'progress', color = { fg = colors.fg, gui = 'bold' }, },
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
          diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.cyan },
          },
        },
        {
          function()
            return '%='
          end,
        },
        {
          function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = ' LSP:',
          color = { fg = '#ffffff', gui = 'bold' },
        },
      },
      lualine_x = {
        {
          'searchcount',
        },
        {
          'o:encoding',
          fmt = string.upper,
          color = { fg = colors.green, gui = 'bold' },
        },
        {
          'fileformat',
          fmt = string.upper,
          icons_enabled = false,
          color = { fg = colors.green, gui = 'bold' },
        },
        {
          'branch',
          icon = '',
          color = { fg = colors.violet, gui = 'bold' },
        },
        {
          'diff',
          symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
          },
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
  }
}
