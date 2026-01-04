---@diagnostic disable: undefined-global
return {
  s(
    "lf",
    fmta(
      "local <> = function(<>)\n  <>\nend",
      { i(1), i(2), i(3) }
    )
  ),
  s(
    "mf",
    c(1, {
      fmta(
        "<>.<> = function(<>)\n  <>\nend",
        { f(
          get_returned_mod_name,
          {}
        ), i(1), i(2), i(3) }
      ),
      fmta(
        "<>:<> = function(<>)\n  <>\nend",
        { f(
          get_returned_mod_name,
          {}
        ), i(1), i(2), i(3) }
      )
    })
  ),
  s(
    "fun",
    fmta(
      "function <> (<>)\n  <>\nend",
      { i(1), i(2), i(3) }
    )
  ),
  s(
    "req",
    fmta(
      "local <> = require '<>'",
      { f(
        function(args)
          local parts = vim.split(args[1][1], ".", { plain = true })
          return parts[#parts] or ""
        end,
        { 1 }
      ), i(1) }
    )
  ),
}
