local state = {
  term = {
    buf = -1,
    win = -1,
  },
}

local create_term = function(opts)
  opts = opts or {}
  local height = opts.height or 10
  -- Create a new scratch buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end


  -- Set window dimensions and position
  local win_config = {
    height = height,
    style = "minimal",
    split = 'below',
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_term = function()
  if not vim.api.nvim_win_is_valid(state.term.win) then
    state.term = create_term { buf = state.term.buf }
    if vim.bo[state.term.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.term.win)
  end
end

vim.api.nvim_create_user_command("Toggleterm", toggle_term, {})
