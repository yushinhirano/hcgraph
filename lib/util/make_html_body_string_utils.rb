
#
#== HTML BODY作成ユーティリティ
#
#=== Overview
#BODYタグを作るための部品。
#
#@autor tohirano
#
module MakeHtmlBodyStringUtils

  #
  #=== Overview
  #シンプルなbody要素の開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したbody要素開始部分。
  #
  def createSimpleBodyStart
    <<-EOF
  <body>
EOF
  end

  #
  #=== Overview
  #シンプルなbody要素の終了部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したbody要素終了部分
  #
  def createSimpleBodyEnd
#    <script src="../js/jquery-1.9.1.min.js"></script>
#    <script src="../js/highcharts.js" type="text/javascript"></script>
#    <script src="../js/gray_scheme.js" type="text/javascript"></script>
    <<-EOF
    <script src="../js/bootstrap.js"></script>
    <script src="../js/google-code-prettify/prettify.js"></script>
    <script>prettyPrint();</script>
  </body>
EOF
  end


  #
  #=== Overview
  #全体共通ナビゲーションバーを作成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したNavigation要素。
  #
  def createCommonNavigation(all_view_config)
    navbar = ""
    navbar << createNavigationDivStart
    navbar << createNavigationProjectLink(all_view_config.title, all_view_config.action_cgi, all_view_config.default_aid)
    navbar << createNavigationLinkDiv(all_view_config)
    navbar << createNavigationDivEnd
    navbar
  end


  #
  #=== Overview
  #ナビゲーションバーセクション開始部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したナビゲーションバー開始要素。
  #
  def createNavigationDivStart
    navStart = ""
    navStart =<<-EOF
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
    EOF
    navStart
  end


  #
  #=== Overview
  #ナビゲーションバーのプロジェクトリンクセクションを作成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String title] プロジェクトタイトル
  #[String actionCgi] 実行CGIパス
  #[String aid] アクションID
  #
  #@Return
  #
  #[String] 生成したプロジェクトリンクセクション要素。
  #
  def createNavigationProjectLink(title,actionCgi,aid)
    navplink = ""
    navplink =<<-EOF
    <a class="brand" href="#{actionCgi}?aid=#{aid}">#{title}</a>
    EOF
    navplink
  end


  #
  #=== Overview
  #ナビゲーションバーのメインリンク部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #[AllViewConfig all_view_config] 画面表示全体コンフィグ
  #
  #@Return
  #
  #[String] 生成したプロジェクトリンクセクション要素。
  #
  def createNavigationLinkDiv(all_view_config)
    navView = all_view_config.nav_view
    ggids = all_view_config.view_group_ggids
    actionCgi = all_view_config.action_cgi
    graphViewAid = all_view_config.graph_view_aid

    navlink = ""
    navstart =<<-EOF
          <div class="nav-collapse collapse">
            <ul class="nav">
    EOF

    navend =<<-EOF
            </ul>
          </div><!--/.nav-collapse -->
    EOF
    if graphViewAid == $currentAid 
      dropStart =<<-EOF
              <li class="dropdown active">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">GraphView <b class="caret"></b></a>
                <ul class="dropdown-menu">
      EOF
    else
      dropStart =<<-EOF
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">GraphView <b class="caret"></b></a>
                <ul class="dropdown-menu">
      EOF
    end
    
    dropEnd =<<-EOF
                </ul>
              </li>
    EOF
    
    # スタート
    navlink << navstart
    
    # 横に並ぶリンク。HomeとAdminのみ。
    navView.each do |nview|
      if nview["aid"] == $currentAid
        now_view =<<-EOF
              <li class="active"><a href="#{actionCgi}?aid=#{nview["aid"]}">#{nview["name"]}</a></li>
        EOF
      else
        now_view =<<-EOF
              <li><a href="#{actionCgi}?aid=#{nview["aid"]}">#{nview["name"]}</a></li>
        EOF
      end
      navlink << now_view
    end
    navlink << dropStart
    
    # ドロップボックス部分。コンフィグによって可変の部分。
    ggids.each do |ggid|
      gconf = all_view_config.getGroupConfig(ggid)
      if ggid == $currentGGid
        now_view =<<-EOF
                  <li class="active"><a href="#{actionCgi}?aid=#{graphViewAid}&ggid=#{ggid}&gpid=#{gconf.default_gpid}">#{gconf.title}</a></li>
        EOF
      else
        now_view =<<-EOF
                  <li><a href="#{actionCgi}?aid=#{graphViewAid}&ggid=#{ggid}&gpid=#{gconf.default_gpid}">#{gconf.title}</a></li>
        EOF
      end
      navlink << now_view
    end
    
    navlink << dropEnd
    navlink << navend
    navlink
  end

  #
  #=== Overview
  #ナビゲーションバーセクション終了部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したナビゲーションバー終了要素。
  #
  def createNavigationDivEnd
    navEnd = ""
    navEnd =<<-EOF
        </div>
      </div>
    </div>
    EOF
    navEnd
  end

  #
  #=== Overview
  #Homeページ用コンテンツを表示する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHomeコンテンツ。
  #
  def createHomeContents
    home_contents =<<-EOF

    <div class="container">

      <div class="well sidebar-nav">
        <h1>HC Graph UI Home</h1>
        <p>High Chartグラフを表示する。</p>
        <p>画面作るのは苦手なんだっつーの！</p>
      </div>

      <hr>

      <footer>
      </footer>

    </div> <!-- /container -->

    EOF
    home_contents
  end

  #
  #=== Overview
  #シンプルなコンテナ開始要素を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したbody要素終了部分
  #
  def createSimpleContainerStart
    <<-EOF
    <div class="container-fluid">
      <div class="row-fluid">
    EOF
  end


  #
  #=== Overview
  #ページ内左メニューの開始要素を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] ページ内左メニュー開始要素
  #
  def createPageMenuStart
    <<-EOF
        <div class="span2">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
    EOF
  end

  #
  #=== Overview
  #ページ内左メニューのタイトル部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] ページ内左メニュータイトル要素
  #
  def createPageMenuTitle(title)
    <<-EOF
              <li class="nav-header">#{title}</li>
    EOF
  end

  #
  #=== Overview
  #ページ内左メニューのアクションリンク部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] ページ内左メニュータイトル要素
  #
  def createPageMenuLink(cgi,aid,ggid,gpid,title)
    menu = ""
    if gpid == $currentGPid
      menu =<<-EOF
              <li class="active"><a href="#{cgi}?aid=#{aid}&ggid=#{ggid}&gpid=#{gpid}">#{title}</a></li>
      EOF
    else
      menu =<<-EOF
              <li><a href="#{cgi}?aid=#{aid}&ggid=#{ggid}&gpid=#{gpid}">#{title}</a></li>
      EOF
    end
    menu
  end

  #
  #=== Overview
  #ページ内左メニューの終了要素を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] ページ内左メニュー終了要素
  #
  def createPageMenuEnd
    <<-EOF
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
    EOF
  end

  #
  #=== Overview
  #メインコンテンツ開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツ開始部分。
  #
  def createSimpleMainContentsStart
    <<-EOF
        <div class="span10">
    EOF
  end


  #
  #=== Overview
  #メインコンテンツヘッダー開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツヘッダ開始要素
  #
  def createSimpleMainContHeaderStart
    <<-EOF
          <div class="hero-unit">
    EOF
  end

  #
  #=== Overview
  #メインコンテンツヘッダー開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツヘッダ開始要素
  #
  def createSimpleMainContHeaderStart
    <<-EOF
          <div class="hero-unit">
    EOF
  end


  #
  #=== Overview
  #メインコンテンツヘッダーのタイトル部分を返す。
  #ついでにDescriptionの始まりも。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツヘッダタイトル部分。
  #
  def createSimpleMainContHeaderTitle(title)
    <<-EOF
            <h3>#{title}</h3>
            <table class="table table-condensed table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>title</th>
                  <th>description</th>
                </tr>
              </thead>
    EOF
  end

  #
  #=== Overview
  #メインコンテンツヘッダーの全体Description部分を返す。
  #実はdescの要素に次の個別要素の始まりを付けただけ。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツヘッダ全体Description部分。
  #
  def createSimpleMainContHeaderDesc(desc)
    <<-EOF
            <caption>#{desc}</caption>
              <tbody>
    EOF
  end


  #
  #=== Overview
  #メインコンテンツヘッダーの個別Description部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツヘッダ個別Description部分。
  #
  def createSimpleMainContHeaderDescList(title,desc,graph_id)
    <<-EOF
                <tr>
                  <td>#{graph_id}</td>
                  <td><a href="##{graph_id}">#{title}</a></td>
                  <td>#{desc}</td>
                </tr>
    EOF
  end


  #
  #=== Overview
  #メインコンテンツヘッダーの終了部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツヘッダの終了部分。
  #
  def createSimpleMainContHeaderEnd
    <<-EOF
              </tbody>
            </table>
          </div>
EOF
  end


  #
  #=== Overview
  #メインコンテンツ終了部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] メインコンテンツ終了部分。
  #
  def createSimpleMainContentsEnd
    <<-EOF
        </div>
EOF
  end


  #
  #=== Overview
  #シンプルなコンテナ終了要素を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したコンテナ終了部分
  #
  def createSimpleContainerEnd
    <<-EOF
      <hr>
      <footer>
        <p></p>
      </footer>
      </div><!--/row-->
    </div><!--/.fluid-container-->
EOF
  end

  #
  #=== Overview
  #グラフ要素開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] グラフ要素開始部分。
  #
  def createSimpleGraphContStart(graph_id)
    <<-EOF
          <div id="#{graph_id}" class="well well-small">
EOF
  end

  #
  #=== Overview
  #グラフ要素説明部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] グラフ要素説明部分。
  #
  def createSimpleGraphContHeader(desc)
    <<-EOF
            <div class="alert alert-info">
              #{desc}
            </div>
EOF
  end

  #
  #=== Overview
  #グラフ要素部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] グラフ要素部分。
  #
  def createSimpleGraphCont(graph_id)
#            <div id="container#{graph_id}" class="graph_contents"></div>
    <<-EOF
            <div id="container#{graph_id}"></div>
EOF
  end



  #
  #=== Overview
  #シンプルなグラフ終了要素を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したグラフ終了部分
  #
  def createSimpleGraphContEnd
    <<-EOF
          </div>
EOF
  end

end
