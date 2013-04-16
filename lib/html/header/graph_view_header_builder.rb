require 'lib/util/make_html_head_string_utils'

require 'lib/html/header/header_builder'
require 'lib/html/header/graph/graph_builder_factory'

#
#== Homeページ用Header部分生成。
#
#=== Overview
#HEAD要素の生成を行う。
#Homeで表示するページ用。
#
#@autor tohirano
#
class GraphViewHeaderBuilder < HeaderBuilder

  include MakeHtmlHeadStringUtils

  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize()
  end
  
  #
  #=== Overview
  #head要素を作成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したhead要素
  #
  def build(all_view_config)
    head = ""
    head << buildHeaderStart(all_view_config)
    head << buildHeaderLinks(all_view_config)
    head << buildHeaderStyles(all_view_config)
    head << buildHeaderGraphScripts(all_view_config)
    head << buildHeaderEnd(all_view_config)
    head
  end

  #
  #=== Overview
  #head要素の開始部分を作成する。
  #ここにtitle要素も入れこむ。どうせ変わんないじゃん。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したhead開始文字列
  #
  def buildHeaderStart(all_view_config)
    head_st = ""
    head_st << createHomeHeaderStart
    head_st << createHtmlTitle(all_view_config.title)
    head_st
  end

  #
  #=== Overview
  #head要素のLink部分を作成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したhead開始文字列
  #
  def buildHeaderLinks(all_view_config)
    createHCHeaderLinkParts
  end


  #
  #=== Overview
  #head要素のStyle部分を作成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したhead開始文字列
  #
  def buildHeaderStyles(all_view_config)
    createGraphViewHeaderStyleParts
  end

  #
  #=== Overview
  #head要素のグラフ記述スクリプト部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したhead開始文字列
  #
  def buildHeaderGraphScripts(all_view_config)
    # ggid、gpidを取得。
    # gpidのコンフィグを読んでgetGraphBuilderに突っ込む。・・・で、いいよね。
    group_view_config = all_view_config.getGroupConfig($currentGGid)
    page_view_config = group_view_config.getPVConfig($currentGPid)
    graph_builder = GraphBuilderFactory::getGraphBuilder(all_view_config)
    head_graph_scripts = ""
    head_graph_scripts << createSimpleJScriptStart
    head_graph_scripts << graph_builder.build(page_view_config)
    head_graph_scripts << createSimpleJScriptEnd
    head_graph_scripts
  
  end

  #
  #=== Overview
  #head要素の終了部分を作成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したhead終了文字列
  #
  def buildHeaderEnd(all_view_config)
    createSimpleHeaderEnd
  end

end
