return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  -- dependencies = { 'rafamadriz/friendly-snippets' },
  lazy = false,
  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts = {
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },
    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev", "lsp", "path", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
    keymap = {
      preset = 'default',
      ['<c-k>'] = false,
      ['<c-b>'] = false,
      ['<c-f>'] = false,
      ['<Tab>'] = false,
      ['<S-Tab>'] = false,
      ['<Up>'] = false,
      ['<Down>'] = false,
    },
  },
  opts_extend = { "sources.default" }

}
