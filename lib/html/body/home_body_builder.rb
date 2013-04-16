require 'lib/util/make_html_body_string_utils'

require 'lib/html/body/body_builder'

#
#== Body要素の生成担当。
#
#=== Overview
#body要素の生成を行う。
#
#
#@autor tohirano
#
class HomeBodyBuilder < BodyBuilder

  include MakeHtmlBodyStringUtils

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
    body = ""
    body << buildBodyStart(all_view_config)
    body << buildNavigationBar(all_view_config)
    body << buildMainContents(all_view_config)
    body << buildBodyEnd(all_view_config)
    body
  end

  #
  #=== Overview
  #body要素の開始部分を作成する。
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
  def buildBodyStart(all_view_config)
    body_st = ""
    body_st << createSimpleBodyStart
    body_st
  end


  #
  #=== Overview
  #body要素のナビゲーション部分を作成する。
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
  def buildNavigationBar(all_view_config)
    body_st = ""
    body_st << createCommonNavigation(all_view_config)
    body_st
  end


  #
  #=== Overview
  #body要素のコンテンツ部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したbodyコンテンツ部分
  #
  def buildMainContents(all_view_config)
    body_ct = ""
    body_ct << createHomeContents
    body_ct
  end

  #
  #=== Overview
  #body要素の終了部分を作成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したbody終了文字列
  #
  def buildBodyEnd(all_view_config)
    body_end = ""
    body_end << createSimpleBodyEnd
    body_end
  end

end

