-- init.lua
local fullscreen = false
local saved_state = nil

-- Recursively capture layout, buffers, and cursor positions
local function capture_layout(layout)
  local t = {}
  t[1] = layout[1]
  if layout[1] == "leaf" then
    local winid = layout[2]
    local buf = vim.api.nvim_win_get_buf(winid)
    local cursor = vim.api.nvim_win_get_cursor(winid)
    t[2] = { buf = buf, cursor = cursor }
  else
    t[2] = {}
    for _, child in ipairs(layout[2]) do
      table.insert(t[2], capture_layout(child))
    end
  end
  return t
end

-- Recursively restore layout, buffers, and cursor positions
-- Returns the window id of the restored leaf if it matches target_buf
local function restore_layout(layout, target_buf)
  if layout[1] == "leaf" then
    local buf = layout[2].buf
    local cursor = layout[2].cursor
    vim.api.nvim_set_current_buf(buf)
    pcall(vim.api.nvim_win_set_cursor, 0, cursor)
    if buf == target_buf then
      return vim.api.nvim_get_current_win()
    end
    return nil
  else
    local first = true
    local target_win = nil
    for _, child in ipairs(layout[2]) do
      if not first then
        if layout[1] == "row" then
          vim.cmd("vsplit")
        else
          vim.cmd("split")
        end
      end
      local win = restore_layout(child, target_buf)
      if win then
        target_win = win
      end
      first = false
    end
    return target_win
  end
end

function ToggleFullscreen()
  if not fullscreen then
    -- Save current tab layout (splits + buffers + cursors + sizes)
    saved_state = {
      layout = capture_layout(vim.fn.winlayout()),
      sizes = vim.fn.winrestcmd(),
      current_buf = vim.api.nvim_get_current_buf(),
    }
    -- Maximize current window
    vim.cmd("only")
    fullscreen = true
  else
    if saved_state then
      -- Clear tab
      -- vim.cmd("only")
      -- Restore layout
      local target_win =
          restore_layout(saved_state.layout, saved_state.current_buf)
      -- Restore sizes
      vim.cmd(saved_state.sizes)
      -- Jump back to the window we were in
      if target_win then
        vim.api.nvim_set_current_win(target_win)
      end
    end
    fullscreen = false
  end
end

vim.api.nvim_create_user_command("ToggleFullscreen", ToggleFullscreen, {})
