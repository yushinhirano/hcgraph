require 'lib/util/make_html_hc_graph_string_utils'
require 'lib/html/header/graph/highcharts/highcharts_graph_builder'

#
#== Highchartsを使用したグラフスクリプト生成。（basic_line）
#
#=== Overview
#Basic Lineタイプのグラフスクリプト生成。
#
#@autor tohirano
#
class PieChartGraphBuilder < HighchartsGraphBuilder

  include MakeHCGraphHtmlStringUtils

  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize()
  end
  
  #
  #=== Overview
  #Basic Lineタイプのグラフスクリプト生成。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[GraphConfig graph_config] グラフ生成コンフィグ
  #
  #@Return
  #
  #[String] 生成したスクリプト
  #
  def build(graph_config)
    script = ""
    script << createHCScriptStart(graph_config.graph_id)
    script << createChartForPieChart(graph_config.graph_id)
    script << createCommonTitle(graph_config.title)
    # 「軸」がない。x軸項目は作らない。
    script << createToolTipSection(graph_config)
    script << createPieChartPlotOptions
    script << createSeriesSection(graph_config)
    script << createHCScriptEnd
    script
  end

end