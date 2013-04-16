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
class GraphViewBodyBuilder < BodyBuilder

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
    # page_view_configを読み込んでおこう。こっからはそこしか使わないはず。

    group_view_config = all_view_config.getGroupConfig($currentGGid)
    page_view_config = group_view_config.getPVConfig($currentGPid)
  
    body = ""
    body << buildBodyStart(all_view_config)
    body << buildNavigationBar(all_view_config)
    body << buildContainerStart(page_view_config)
    body << buildPageMenu(all_view_config)
    body << buildMainContentsStart(page_view_config)
    body << buildMainContentsHeader(page_view_config)
    body << buildMainContents(page_view_config)
    body << buildMainContentsEnd(page_view_config)
    body << buildContainerEnd(page_view_config)

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
  #body要素メインのコンテナ開始部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したコンテナ開始部分。
  #
  def buildContainerStart(page_view_config)
    cont_st = ""
    cont_st << createSimpleContainerStart
    cont_st
  end


  #
  #=== Overview
  #ページ内左に表示するメニュー部分をを生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したコンテナ開始部分メニュー部分。
  #
  def buildPageMenu(all_view_config)
    group_view_config = all_view_config.getGroupConfig($currentGGid)
    page_view_config = group_view_config.getPVConfig($currentGPid)

    page_menu = ""
    page_menu << createPageMenuStart
    page_menu << createPageMenuTitle(group_view_config.title)

    # 全gpidについてメニューを作っていく。    
    group_view_config.page_view_gpids.each do |gpid|
      pvconf = group_view_config.getPVConfig(gpid)
      page_menu << createPageMenuLink(all_view_config.action_cgi, $currentAid, $currentGGid, gpid, pvconf.title)
    end
    
    page_menu << createPageMenuEnd
    page_menu
  end

  #
  #=== Overview
  #body要素メインコンテンツの開始部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[PageViewConfig page_view_config] 1ページ表示定義コンフィグ
  #
  #@Return
  #
  #[String] 生成したコンテナ開始部分。
  #
  def buildMainContentsStart(page_view_config)
    cont_st = ""
    cont_st << createSimpleMainContentsStart
    cont_st
  end

  #
  #=== Overview
  #body要素メインコンテンツのヘッダ部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[PageViewConfig page_view_config] 1ページ表示定義コンフィグ
  #
  #@Return
  #
  #[String] 生成したヘッダ部分
  #
  def buildMainContentsHeader(page_view_config)
    cont_hd = ""
    cont_hd << createSimpleMainContHeaderStart
    cont_hd << createSimpleMainContHeaderTitle(page_view_config.title)
    
    cont_hd << createSimpleMainContHeaderDesc(page_view_config.description)
    
    # グラフコンフィグ全てについてdescription記述。
    page_view_config.getGraphConfigs.each do |gconf|
      cont_hd << createSimpleMainContHeaderDescList(gconf.title,gconf.description,gconf.graph_id)
    end
    cont_hd << createSimpleMainContHeaderEnd
    
    cont_hd
  end


  #
  #=== Overview
  #body要素メインコンテンツのグラフ表示部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[PageViewConfig page_view_config] 1ページ表示定義コンフィグ
  #
  #@Return
  #
  #[String] 生成要素
  #
  def buildMainContents(page_view_config)
    
    cont = ""
    
    page_view_config.getGraphConfigs.each do |gconf|
      cont << createSimpleGraphContStart(gconf.graph_id)
      cont << createSimpleGraphContHeader(gconf.description)
      cont << createSimpleGraphCont(gconf.graph_id)
      cont << createSimpleGraphContEnd
    end

    cont
  end


  #
  #=== Overview
  #body要素メインコンテンツの終了部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[PageViewConfig page_view_config] 1ページ表示定義コンフィグ
  #
  #@Return
  #
  #[String] 生成した終了部分。
  #
  def buildMainContentsEnd(page_view_config)
    cont_ed = ""
    cont_ed << createSimpleMainContentsEnd
    cont_ed
  end

  #
  #=== Overview
  #body要素コンテナ部分の終了要素を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[PageViewConfig page_view_config] 1ページ表示定義コンフィグ
  #
  #@Return
  #
  #[String] 生成した終了部分。
  #
  def buildContainerEnd(page_view_config)
    cont_st = ""
    cont_st << createSimpleContainerEnd
    cont_st
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

