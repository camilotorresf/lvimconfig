local function get_line_number(args, parent)
  local position = vim.api.nvim_win_get_cursor(0)
  return tostring(position[1])
end

local function get_function_name(args, parent)
  local file_path = vim.api.nvim_buf_get_name(0)
  local file_name = file_path:match("^.+/(.+).tsx?$")
  return file_name
end

return {
  s(
    {
      trig = "clog",
      name = "python-print-variable",
      description = "Print variable to a debug trace",
    },
    {
      t("print('** CAMILO "),
      f(get_function_name),
      t(":"),
      f(get_line_number),
      t("', "),
      i(0),
      t(") # TODO camilo: remove this"),
    }
  ),

  s(
    {
      trig = "tlog",
      name = "python-print-log",
      description = "Print debug trace",
    },
    {
      t("print('** CAMILO "),
      f(get_function_name),
      t(":"),
      f(get_line_number),
      t(" "),
      i(0),
      t("') # TODO camilo: remove this"),
    }
  ),

  s(
    {
      trig = "ctd",
      name = "python-todo",
      description = "Adds a TODO comment for Camilo",
    }, {
      t("# TODO camilo: "),
      i(0),
    }
  ),

}
