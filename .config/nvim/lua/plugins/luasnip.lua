return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  -- lazy = false,
  keys = {
    {
      "<c-k>",
      mode = { "i", "s" },
      function()
        if require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        end
      end
    },
    {
      "<c-j>",
      mode = { "i", "s" },
      function()
        if require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        end
      end
    },
    {
      "<c-l>",
      mode = { "i", "s" },
      function()
        if require("luasnip").choice_active() then
          require("luasnip").change_choice(1)
        end
      end
    }
  },
  config = function(opts)
    opts = opts or {}
    opts.keep_roots = true
    opts.link_roots = true
    opts.exit_roots = false
    opts.link_children = true
    opts.update_events = { "TextChanged", "TextChangedI" }
    opts.enable_autosnippets = true
    require("luasnip").setup(opts)
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
  end
}
