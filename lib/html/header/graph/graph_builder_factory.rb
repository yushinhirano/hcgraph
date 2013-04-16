require 'lib/html/header/graph/graph_builder_by_highcharts'

#
#== GraphBuilder ファクトリー
#
#=== Overview
#GraphBuilderクラスのファクトリー。
#
#@autor tohirano
#
class GraphBuilderFactory

  @@highcharts = nil

  #
  #=== Overview
  #GraphBuilderクラスを返す。今のところhighchartしかないし、実はこれから増える予定もないのだが。
  #というより、ここを変えたらここだけの影響に留まらないから、こんなところを抽象化する意味もなし。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[GraphBuilder] GraphBuilderインスタンス
  #
  def GraphBuilderFactory.getGraphBuilder(all_view_config)
    if @@highcharts == nil
      @@highcharts = GraphBuilderByHighcharts.new
    end
    return @@highcharts

  end

end



