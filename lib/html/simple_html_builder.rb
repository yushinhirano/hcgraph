require 'lib/html/html_builder'
require 'lib/html/make_html_string_utils'
require 'lib/html/header/header_builder_factory'
require 'lib/html/body/body_builder_factory'

#
#== HTMLのシンプルな全体作成
#
#=== Overview
#<html>〜</html>までの作成を担当する。
#
#@autor tohirano
#
class SimpleHtmlBuilder < HtmlBuilder

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
  #開始、head要素、body要素、終了、というシンプルな構成。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Hash group_config] HTML生成グループコンフィグ。
  #
  #* group_config
  #  [Integer Hash=>:xdata] X軸データカラム（デフォルト：1）
  #  [Integer Hash=>:ydata] Y軸データカラム（デフォルト：2）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したHTML文字列
  #
  def build(sub_group_num,group_config)
    # 一行で書くのがためらわれる(笑)
    html = ""
    html << buildHtmlStart(sub_group_num,group_config)
    html << buildHeader(sub_group_num,group_config)
    html << buildBody(sub_group_num,group_config)
    html << buildHtmlEnd(sub_group_num,group_config)
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
  #@Return
  #
  #[String] 生成したHTML開始文字列
  #
  def buildHtmlStart(sub_group_num,group_config)
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
  def buildHtmlEnd(sub_group_num,group_config)
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
  #[Hash group_config] HTML生成グループコンフィグ。
  #
  #@Return
  #
  #[String] 生成したHEAD要素
  #
  def buildHeader(sub_group_num,group_config)
    header_builder = HeaderBuilderFactory::getHeaderBuilder(group_config)
    header_builder.build(sub_group_num,group_config)
  end

  #
  #=== Overview
  #body要素の生成。尚、メソッド名とか変数名が少々アレだが他意はない。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Hash group_config] HTML生成グループコンフィグ。
  #
  #@Return
  #
  #[String] 生成したHEAD要素
  #
  def buildBody(sub_group_num,group_config)
    body_builder = BodyBuilderFactory::getBodyBuilder(group_config)
    body_builder.build(sub_group_num,group_config)
  end


end





