require 'lib/util/make_html_head_string_utils'

require 'lib/html/header/header_builder'

#
#== Homeページ用Header部分生成。
#
#=== Overview
#HEAD要素の生成を行う。
#Homeで表示するページ用。
#
#@autor tohirano
#
class HomeHeaderBuilder < HeaderBuilder

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
    createCommonHeaderLinkParts
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
    createHomeHeaderStyleParts
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