local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
local themes = require("telescope.themes")

local M = {}


M.live_multigrep = function (opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function (prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end
      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"}
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(themes.get_ivy(opts), {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

M.config_commits = function(opts)
  opts = opts or {}
  opts.entry_maker = vim.F.if_nil(opts.entry_maker, make_entry.gen_from_git_commits(opts))
  local home = os.getenv("HOME")
  local git_command = vim.F.if_nil(opts.git_command, { "git", "--git-dir="..home.."/personal/dotfiles.git/", "--work-tree="..home, "log", "--pretty=oneline","--abbrev-commit" })

  pickers
    .new(themes.get_ivy(opts), {
      prompt_title = "Git Commits",
      finder = finders.new_oneshot_job(git_command, opts),
      -- TODO maybe fix in future
      previewer = {
        previewers.git_commit_diff_to_parent.new(opts),
        previewers.git_commit_diff_to_head.new(opts),
        previewers.git_commit_diff_as_was.new(opts),
        previewers.git_commit_message.new(opts),
      },
      sorter = conf.file_sorter(opts),
      attach_mappings = function(_, map)
        actions.select_default:replace(actions.git_checkout)
        map({ "i", "n" }, "<c-r>m", actions.git_reset_mixed)
        map({ "i", "n" }, "<c-r>s", actions.git_reset_soft)
        map({ "i", "n" }, "<c-r>h", actions.git_reset_hard)
        return true
      end,
    })
    :find()
end

return M
