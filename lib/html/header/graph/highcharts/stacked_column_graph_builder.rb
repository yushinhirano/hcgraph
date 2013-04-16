require 'lib/util/make_html_hc_graph_string_utils'
require 'lib/html/header/graph/highcharts/highcharts_graph_builder'

#
#== Highchartsを使用したグラフスクリプト生成。（basic_line）
#
#=== Overview
#Stacked Columnタイプのグラフスクリプト生成。
#
#@autor tohirano
#
class StackedColumnGraphBuilder < HighchartsGraphBuilder

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
    script << createChartColumn(graph_config.graph_id)
    script << createCommonTitle(graph_config.title)
    script << createXAxisSection(graph_config.xAxis)
    script << createCommonYAxis(graph_config.yAxis)
    
    script << createToolTipSection(graph_config)
    script << createStackedPlotOptions
    
    script << createRightLegend
    script << createSeriesSection(graph_config)
    script << createHCScriptEnd
    script
  end

end