require 'lib/html/header/graph/highcharts/basic_line_graph_builder.rb'
require 'lib/html/header/graph/highcharts/stacked_percentage_column_graph_builder'
require 'lib/html/header/graph/highcharts/stacked_column_graph_builder'
require 'lib/html/header/graph/highcharts/pie_chart_graph_builder.rb'
require 'lib/html/header/graph/highcharts/bar_basic_column_graph_builder.rb'

#
#== HighchartsGraphBuilder ファクトリー
#
#=== Overview
#HighchartsGraphBuilderクラスのファクトリー。
#
#@autor tohirano
#
class HighchartsGraphBuilderFactory

  @@basic_line = nil
  @@stacked_percentage_column = nil
  @@stacked_column = nil
  @@pie_chart = nil
  @@basic_column = nil

  #
  #=== Overview
  #HighchartsGraphBuilderクラスを返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[GraphConfig graph_config] グラフ生成コンフィグ。
  #
  #@Return
  #
  #[GraphBuilder] GraphBuilderインスタンス
  #
  def HighchartsGraphBuilderFactory.getHighchartsGraphBuilder(graph_config)
    case graph_config.type
    when "basic_line" then
      if @@basic_line == nil
        @@basic_line = BasicLineGraphBuilder.new
      end
      return @@basic_line

    when "basic_column"
      if @@basic_column == nil
        @@basic_column = BarBasicColumnGraphBuilder.new
      end
      return @@basic_column

    when "stacked_column"
      if @@stacked_column == nil
        @@stacked_column = StackedColumnGraphBuilder.new
      end
      return @@stacked_column

    when "stacked_percentage_column"
      if @@stacked_percentage_column == nil
        @@stacked_percentage_column = StackedPercentageColumnGraphBuilder.new
      end
      return @@stacked_percentage_column

    when "pie_chart"
      if @@pie_chart == nil
        @@pie_chart = PieChartGraphBuilder.new
      end
      return @@pie_chart
    else
      raise "invalid graph type => [#{graph_config.type}]"
    end

  end

end



