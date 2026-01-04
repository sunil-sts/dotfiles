local compile_buf = nil
local compile_win = nil
local compile_cmd = nil
local previous_win = nil

local toggle_compile = function()

end


local function ask_command(prompt)
  return vim.fn.input(prompt .. " ", compile_cmd or "", "shellcmd")
end

local function follow_link()
  local line = vim.api.nvim_get_current_line()
  print(vim.o.errorformat)
  local file, lnum, col = string.match(line, "([^:%s]+):(%d+):(%d+)")
  if not file then
    file, lnum = string.match(line, "([^:%s]+):(%d+)")
    col = 1
  end
  if file and lnum then
    if compile_win and vim.api.nvim_win_is_valid(compile_win) then
      vim.api.nvim_win_close(compile_win, true)
      compile_win = nil
    end
    if previous_win and vim.api.nvim_win_is_valid(previous_win) then
      vim.api.nvim_set_current_win(previous_win)
    end
    vim.cmd("edit +" .. lnum .. " " .. vim.fn.fnameescape(file))
    vim.api.nvim_win_set_cursor(0, { tonumber(lnum), tonumber(col) - 1 })
  else
    vim.notify("No file reference found on this line", vim.log.levels.WARN)
  end
end

local function set_buf_keymaps(buf)
  vim.keymap.set("n", "<CR>", follow_link, { buffer = buf, silent = true })
  vim.keymap.set("n", "<C-]>", follow_link, { buffer = buf, silent = true })
  vim.keymap.set("n", "q", toggle_compile, { buffer = buf, silent = true })
end

local function run_compile(cmd)
  compile_cmd = cmd or compile_cmd
  if not compile_cmd or compile_cmd == "" then
    vim.notify("No compile command set. Use :CompModeSet", vim.log.levels.WARN)
    return
  end

  previous_win = vim.api.nvim_get_current_win()

  if not compile_buf or not vim.api.nvim_buf_is_valid(compile_buf) then
    compile_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(compile_buf, "CompileOutput")
    set_buf_keymaps(compile_buf)
  end

  if not compile_win or not vim.api.nvim_win_is_valid(compile_win) then
    vim.cmd("botright split")
    compile_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(compile_win, compile_buf)
    vim.cmd("resize 12")
  end

  vim.api.nvim_set_option_value("modifiable", true, { buf = compile_buf })
  vim.api.nvim_buf_set_lines(compile_buf, 0, -1, false, {})

  local output_lines = {}

  local function append_lines(data)
    for _, line in ipairs(data or {}) do
      if line ~= "" and line ~= nil then
        table.insert(output_lines, line)
        vim.api.nvim_buf_set_lines(compile_buf, -1, -1, false, { line })
      end
    end
  end

  vim.fn.jobstart(compile_cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      append_lines(data)
    end,
    on_stderr = function(_, data)
      append_lines(data)
    end,
    on_exit = function(_, code)
      vim.api.nvim_set_option_value("modifiable", false, { buf = compile_buf })
      vim.notify("Compile finished (exit code " .. code .. ")", vim.log.levels.INFO)

      local filtered = {}
      for _, l in ipairs(output_lines) do
        if l and l:match("%S") then
          table.insert(filtered, l)
        end
      end
      local tmpfile = vim.fn.tempname()
      vim.fn.writefile(filtered, tmpfile)

      vim.cmd("silent! cgetfile " .. vim.fn.fnameescape(tmpfile))
      vim.fn.delete(tmpfile)
    end,
  })
end

toggle_compile = function()
  if compile_win and vim.api.nvim_win_is_valid(compile_win) then
    vim.api.nvim_win_close(compile_win, true)
    compile_win = nil
  else
    run_compile()
  end
end

vim.api.nvim_create_user_command("CompModeSet", function()
  local new_cmd = ask_command("Compile command:")
  if new_cmd and new_cmd ~= "" then
    compile_cmd = new_cmd
    vim.notify("Compile command set to: " .. compile_cmd)
    run_compile()
  end
end, {})

vim.api.nvim_create_user_command("CompModeRecompile", function()
  run_compile()
end, {})

vim.api.nvim_create_user_command("CompModeToggle", function()
  toggle_compile()
end, {})
