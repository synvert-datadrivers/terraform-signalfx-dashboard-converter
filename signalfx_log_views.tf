locals {
  signalfx_log_views = {
    for chart in local.charts : chart["id"] => {
      name         = chart["name"]
      program_text = chart["programText"]
      description  = chart["description"]
      time_range   = try(chart["options"]["time"]["range"], null)
      columns = [
        for column in chart["options"]["columns"] : column["name"]
      ]
      # TODO: the provider docs do not specify how sort_options is supposed to be declared (it currently comes as list(object))
      sort_options       = chart["options"]["sortOptions"]
      default_connection = chart["options"]["defaultConnection"]

      # missing fields not yet known how to map:
      # - start_time - (Optional) Seconds since epoch. Used for visualization. Conflicts with time_range.
      # - end_time - (Optional) Seconds since epoch. Used for visualization. Conflicts with time_range.
    }
    if chart["options"]["type"] == "LogsChart"
  }
}
