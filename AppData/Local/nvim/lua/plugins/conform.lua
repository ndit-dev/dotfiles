return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Ersätt befintliga SQL-formatters
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.sql = { "sql_formatter" }

    -- Definiera sql_formatter
    opts.formatters = opts.formatters or {}
    opts.formatters.sql_formatter = {
      command = "sql-formatter",
      args = { "--language", "tsql" },
    }

    return opts
  end,
}
