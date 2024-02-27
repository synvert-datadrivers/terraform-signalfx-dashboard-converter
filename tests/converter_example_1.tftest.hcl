variables {
  dashboard_file_path = "examples/default-dashboard-export/dashboard_Intro to Splunk Observability Cloud.json"
}

run "validate_output_dashboard" {
  command = plan
  assert {
    condition = output.signalfx_dashboard == {
      charts = {
        EpSGwz_AIAA = {
          column = 6
          height = 1
          row    = 0
          width  = 6
        }
        EpSGxbaAIAA = {
          column = 0
          height = 1
          row    = 2
          width  = 12
        }
        EpSGxovAIAA = {
          column = 6
          height = 1
          row    = 1
          width  = 6
        }
        EpSGyJgAAAA = {
          column = 0
          height = 2
          row    = 0
          width  = 6
        }
      }
      charts_resolution = "default"
      description       = "Intro to Splunk Observability Cloud"
      end_time          = null
      filters           = []
      name              = "Intro to Splunk Observability Cloud"
      start_time        = null
      time_range        = null
      variables         = []
    }
    error_message = "Output does not match expected output"
  }
}

run "validate_output_list_charts" {
  command = plan
  assert {
    condition     = output.signalfx_list_charts == {}
    error_message = "Output does not match expected output"
  }
}

run "validate_output_log_views" {
  command = plan
  assert {
    condition     = output.signalfx_log_views == {}
    error_message = "Output does not match expected output"
  }
}

run "validate_output_single_value_charts" {
  command = plan
  assert {
    condition     = output.signalfx_single_value_charts == {}
    error_message = "Output does not match expected output"
  }
}

run "validate_output_table_charts" {
  command = plan
  assert {
    condition     = output.signalfx_table_charts == {}
    error_message = "Output does not match expected output"
  }
}

run "validate_output_text_charts" {
  command = plan
  assert {
    condition = output.signalfx_text_charts["EpSGyJgAAAA"]["markdown"] ==    {
      EpSGxbaAIAA = {
        description = ""
        markdown    = "If you're interested in monitoring infrastructure, <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.start&version=current\" target=\"_blank\">start</a> by installing the <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.Splunk_OpenTelemetry_Connector&version=current\" target=\"_blank\">Splunk OpenTelemetry Connector</a> or <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.other_integrations&version=current\" target=\"_blank\">other integrations</a>. Since Splunk Observability Cloud is great for exploring metrics from any source, we've also injected some sample custom application data into your Splunk Observability Cloud environment and created sample charts from it. To check them out, start by going  to the list of tabs above and selecting `Part 1`.\n<br>\n\nIf you already have metrics in the environment and know what you want to do, go ahead and create a new <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.dashboard&version=current\" target=\"_blank\">dashboard</a> by clicking on the create ('+' sign) icon, and start making your own charts. If you get stuck or need any help, check out our <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.product_documentation&version=current\" target=\"_blank\">product documentation</a> or ask us a question at [observability-support@splunk.com](mailto:observability-support@splunk.com)."
        name        = "Exploring Splunk Observability Cloud further"
      }
      EpSGyJgAAAA = {
        description = ""
        markdown    = "Welcome to Splunk Observability Cloud! To get you started with monitoring and alerting, let's go over some basics. \n\n#####**Dashboards**\nWhether you are seeing how a code push impacts your memory utilization or tracking the behavior of a <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.Kubernetes&version=current\" target=\"_blank\">Kubernetes</a> cluster, a dashboard is the place to organize and share charts and notes (e.g. runbooks) about the things that matter to you. We provide built-in dashboards for many common resources and services once you set up integrations for them, and let you <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.navigate&version=current\" target=\"_blank\">navigate</a> them easily.\n\n#####**Charts**\nDashboards contain one or more charts. Our charts are not just for data visualization; they are also vehicles for exploring metrics about your environment, applying statistical functions or mathematical expressions to the raw metrics you send in, and helping you <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.find_correlations_patterns_and_trends&version=current\" target=\"_blank\">find correlations, patterns and trends</a>. \n\n#####**Alerts**\nSplunk Observability Cloud makes it easy for you to determine when your apps or infrastructure are behaving within normal bounds, and to tell you when they're not. You can read more about setting up detectors and alerts in our <a href=\"https://quickdraw.splunk.com/redirect/?product=Observability&location=sample_dashboard_group.documentation&version=current\" target=\"_blank\">documentation</a>."
        name        = "The basics"
      }
    }["EpSGyJgAAAA"]["markdown"]
    error_message = "Output does not match expected output"
  }
}

run "validate_output_time_charts" {
  command = plan
  assert {
    condition = output.signalfx_time_charts == {
      EpSGwz_AIAA = {
        axes_include_zero = false
        axes_precision    = null
        axis_left = {
          high_watermark       = null
          high_watermark_label = null
          label                = "Transactions"
          low_watermark        = null
          low_watermark_label  = null
          max_value            = null
          min_value            = null
        }
        axis_right                = {}
        color_by                  = "Dimension"
        description               = "Moving average applied as smoothing function."
        disable_sampling          = false
        event_options             = []
        histogram_options         = null
        legend_option_fields      = []
        max_delay                 = null
        minimum_resolution        = 0
        name                      = "Transactions per second by host and datacenter"
        on_chart_legend_dimension = null
        plot_type                 = "AreaChart"
        program_text              = "A = data('demo.trans.count',rollup='rate').sum(by=['demo_host', 'demo_datacenter']).mean(over='15s').publish(label='A')"
        show_data_markers         = false
        show_event_lines          = false
        time_range                = 60000
        timezone                  = null
        unit_prefix               = "Metric"
        viz_options = [
          {
            axis         = "left"
            color        = null
            display_name = "Transactions"
            label        = "A"
            plot_type    = null
            value_prefix = null
            value_suffix = null
            value_unit   = null
          },
        ]
      }
      EpSGxovAIAA = {
        axes_include_zero = false
        axes_precision    = null
        axis_left = {
          high_watermark       = null
          high_watermark_label = null
          label                = "Latency (ms)"
          low_watermark        = null
          low_watermark_label  = null
          max_value            = null
          min_value            = null
        }
        axis_right                = {}
        color_by                  = "Metric"
        description               = ""
        disable_sampling          = false
        event_options             = []
        histogram_options         = null
        legend_option_fields      = []
        max_delay                 = null
        minimum_resolution        = 0
        name                      = "Real time transaction latency vs. 3 minutes ago"
        on_chart_legend_dimension = null
        plot_type                 = "LineChart"
        program_text              = "A = data('demo.trans.latency').percentile(pct=95).publish(label='A')\nB = data('demo.trans.latency').percentile(pct=95).timeshift('3m').publish(label='B')"
        show_data_markers         = false
        show_event_lines          = false
        time_range                = 180000
        timezone                  = null
        unit_prefix               = "Metric"
        viz_options = [
          {
            axis         = "left"
            color        = "lilac"
            display_name = "95th percentile of latency"
            label        = "A"
            plot_type    = null
            value_prefix = null
            value_suffix = null
            value_unit   = null
          },
          {
            axis         = "left"
            color        = "azure"
            display_name = "95th percentile of latency - 3 minutes ago"
            label        = "B"
            plot_type    = null
            value_prefix = null
            value_suffix = null
            value_unit   = null
          },
        ]
      }
    }
    error_message = "Output does not match expected output"
  }
}
