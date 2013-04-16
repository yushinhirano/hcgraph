require 'lib/html/header/graph/graph_builder'
require 'lib/html/header/graph/highcharts/highcharts_graph_builder_factory'

#
#== Highchartsを使用したグラフスクリプト生成。
#
#=== Overview
#Highchartsにより、グラフを描画するスクリプトを記述する。
#
#@autor tohirano
#
class GraphBuilderByHighcharts < GraphBuilder

  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize()
  end
  
  #
  #=== Overview
  #グラフ生成スクリプト部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[PageViewConfig page_view_config] 1ページ表示定義コンフィグ
  #
  #@Return
  #
  #[String] 生成したグラフスクリプト要素。
  #
  def build(page_view_config)
    graph = ""

    # 全グラフコンフィグに対してグラフ記述スクリプト部を生成していく。    
    page_view_config.getGraphConfigs.each do |gconf|
      graph_builder = HighchartsGraphBuilderFactory::getHighchartsGraphBuilder(gconf)
      graph << graph_builder.build(gconf)
    end

    graph
  end

end
