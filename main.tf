locals {
  dashboard_json = jsondecode(file(var.dashboard_file_path))
  charts         = [for chart in local.dashboard_json["chartExports"] : chart["chart"]]
  dashboard      = local.dashboard_json["dashboardExport"]["dashboard"]
  axis_lookup_map = {
    # translates the yAxis value for viz options between the inger value and the name
    0 = "left"
    1 = "right"
  }
  color_map_for_viz_options = {
    # translates palette indices to color names for viz options only
    0  = "gray"
    1  = "blue"
    2  = "azure"
    3  = "navy"
    4  = "brown"
    5  = "orange"
    6  = "yellow"
    7  = "magenta"
    8  = "purple"
    9  = "pink"
    10 = "violet"
    11 = "lilac"
    12 = "iris"
    13 = "emerald"
    14 = "green"
    15 = "aquamarine"
  }
  color_map_for_scales = {
    # translates palette indices to color names for color scale only (e.g. used in single value charts, this is a different palette!)
    0  = "gray"
    1  = "blue"
    2  = "light_blue"
    3  = "navy"
    4  = "dark_orange"
    5  = "orange"
    6  = "dark_yellow"
    7  = "magenta"
    8  = "cerise"
    9  = "pink"
    10 = "violet"
    11 = "purple"
    12 = "gray_blue"
    13 = "dark_green"
    14 = "green"
    15 = "aquamarine"
    16 = "red"
    17 = "yellow"
    18 = "vivid_yellow"
    19 = "light_green"
    20 = "lime_green"
  }
}
