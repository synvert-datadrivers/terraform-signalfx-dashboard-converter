locals {
  signalfx_table_charts = {
    for chart in local.charts : chart["id"] => {
      name         = chart["name"]
      program_text = chart["programText"]
      description  = chart["description"]
      group_by     = chart["options"]["groupBy"]
    }
    if chart["options"]["type"] == "TableChart"
  }
}
