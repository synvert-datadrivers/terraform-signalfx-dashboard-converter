locals {
  signalfx_text_charts = {
    for chart in local.charts : chart["id"] => {
      name        = chart["name"]
      description = chart["description"]
      markdown    = chart["options"]["markdown"]
    }
    if chart["options"]["type"] == "Text"
  }
}
