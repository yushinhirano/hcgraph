
#
#== HTML HEAD作成ユーティリティ
#
#=== Overview
#HEADタグを作るための部品。
#
#@autor tohirano
#
module MakeHtmlHeadStringUtils

  #
  #=== Overview
  #Homeページ用HEAD開始部分を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したシンプルなヘッダ部分。
  #
  def createHomeHeaderStart
    <<-EOF
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-language" content="ja">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
EOF
  end


  #
  #=== Overview
  #HEAD要素のtitleを指定の文字列で埋め込んで返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String title] title要素に指定する文字列。
  #
  #@Return
  #
  #[String] 生成したtitle要素。
  #
  def createHtmlTitle(title)
    return "<title>#{title}</title>\n"
  end

  #
  #=== Overview
  #HEAD要素のlink部分を生成する。
  #全ページ共通でTwitter Bootstrap用のjsを読めばよい。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHEAD部分のlink要素。
  #
  def createCommonHeaderLinkParts
    <<-EOF
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../js/google-code-prettify/prettify.css" rel="stylesheet">
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
EOF
  end


  #
  #=== Overview
  #HEAD要素のlink部分を生成する。
  #全ページ共通でTwitter Bootstrap用のjsを読み、
  #それにHighChart用のJSを追加する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHEAD部分のlink要素。
  #
  def createHCHeaderLinkParts
#    <link REL="stylesheet" href="../css/basic.css" TYPE="TEXT/CSS">
#    <script src="../js/jquery.js" type="text/javascript"></script>
#    <script src="../js/jquery-1.9.1.min" type="text/javascript"></script>
#    <script src="../js/highcharts.js" type="text/javascript"></script>

    <<-EOF
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../js/google-code-prettify/prettify.css" rel="stylesheet">
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../js/highcharts.js" type="text/javascript"></script>
    <script src="../js/gray_scheme.js" type="text/javascript"></script>
EOF
  end



  #
  #=== Overview
  #HEAD要素のstyle部分を生成する。
  #Homeページ用。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHEAD部分のstyle要素。
  #
  def createHomeHeaderStyleParts
    <<-EOF
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    EOF
  end

  #
  #=== Overview
  #HEAD要素のstyle部分を生成する。
  #GraphViewページ用。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHEAD部分のstyle要素。
  #
  def createGraphViewHeaderStyleParts
    <<-EOF
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
      .hero-unit .table tbody td {
        font-size: 70%;
      }
    </style>
    EOF
  end



  #
  #=== Overview
  #シンプルなヘッダ部分の終了を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] ヘッダ終了部分
  #
  def createSimpleHeaderEnd
    <<-END
  </head>
END
  end

  #
  #=== Overview
  #シンプルなjavascript開始部分を返す。
  #
  #== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したjavascript開始部分。
  #
  def createSimpleJScriptStart
    <<-EOF
    <script type="text/javascript">
  EOF
  end

  #
  #=== Overview
  #シンプルなjavascriptの終了部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したjavascript終了部分
  #
  def createSimpleJScriptEnd
    <<-EOF
    </script>
  EOF
  end


end

