require 'lib/util/make_html_string_utils'

require 'lib/html/html_builder'
require 'lib/html/header/home_header_builder'
require 'lib/html/body/home_body_builder'

#
#== Home用HTML作成
#
#=== Overview
#<html>～</html>までの作成を担当する。
#
#@autor tohirano
#
class HomeHtmlBuilder < HtmlBuilder

  include MakeHtmlStringUtils

  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize()
  end
  
  #
  #=== Overview
  #HTML全体の作成。
  #開始、head要素、body要素、終了。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したHTML文字列
  #
  def build(all_view_config)
    # 一行で書くのがためらわれる(笑)
    html = ""
    html << buildHtmlStart(all_view_config)
    html << buildHeader(all_view_config)
    html << buildBody(all_view_config)
    html << buildHtmlEnd(all_view_config)
    html
  end

  #
  #=== Overview
  #HTML開始部分の生成。現在、Simpleなタイプしか用意しない。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したHTML開始文字列
  #
  def buildHtmlStart(all_view_config)
    return createSimpleHtmlStart
  end

  #
  #=== Overview
  #HTML終了部分の生成。現在、Simpleなタイプしか用意しない。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHTML開始文字列
  #
  def buildHtmlEnd(all_view_config)
    return createSimpleHtmlEnd
  end

  #
  #=== Overview
  #HEAD要素の生成
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したHEAD要素
  #
  def buildHeader(all_view_config)
    header_builder = HomeHeaderBuilder.new
    header_builder.build(all_view_config)
  end

  #
  #=== Overview
  #body要素の生成。尚、メソッド名とか変数名が少々アレだが他意はない。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したHEAD要素
  #
  def buildBody(all_view_config)
    body_builder = HomeBodyBuilder.new
    body_builder.build(all_view_config)
  end


end





