
#
#== HTML作成ユーティリティ
#
#=== Overview
#HTML文字列を作るための部品。
#
#@autor tohirano
#
module MakeHtmlStringUtils

  #
  #=== 共通HTML開始部分
  #
  HTML_START =<<-EOF
<!DOCTYPE html>
<html>
EOF

  #
  #=== 共通HTML終了部分
  #
  HTML_END =<<-EOF
</html>
EOF

  #
  #=== HEADの開始部分〜固定部分
  #
  HTML_HEAD_START =<<-EOF
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-language" content="ja">
EOF

  #
  #=== HEAD中のリンク（シンプル）
  #
  HTML_HEAD_SIMPLE_LINK =<<-EOF
    <link REL="stylesheet" href="../css/basic.css" TYPE="TEXT/CSS">
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/highcharts.js" type="text/javascript"></script>
    <script src="../js/gray_scheme.js" type="text/javascript"></script>
EOF

  #
  #=== HEADの終了部分
  #
  HTML_HEAD_END =<<-EOF
    </head>
EOF

  #
  #=== Chart記述JS部分の開始
  #
  HTML_JS_START =<<-EOF
    <script type="text/javascript">
EOF

  #
  #=== Chart記述JS部分の終了
  #
  HTML_JS_END =<<-EOF
    </script>
EOF

  #
  #=== 共通body開始部分
  #
  HTML_BODY_START =<<-EOF
<body>
EOF

  #
  #=== 共通body終了部分
  #
  HTML_BODY_END =<<-EOF
</body>
EOF

  #
  #=== Overview
  #シンプルなHTMLの開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHTML開始部分。
  #
  def createSimpleHtmlStart
    return HTML_START
  end

  #
  #=== Overview
  #シンプルなHTMLの終了部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHTML終了部分
  #
  def createSimpleHtmlEnd
    return HTML_END
  end

  #
  #=== Overview
  #シンプルなヘッダ開始部分を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したシンプルなヘッダ部分。
  #
  def createSimpleHeaderStart
    return HTML_HEAD_START
  end

  #
  #=== Overview
  #シンプルなヘッダのリンク記述部分を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したシンプルなheadのLink部分。
  #
  def createSimpleHeaderLinkPats
    return HTML_HEAD_SIMPLE_LINK
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
  def createSimpleHeaderEnd()
    return HTML_HEAD_END
  end

  #
  #=== Overview
  #シンプルなjavascript開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したjavascript開始部分。
  #
  def createSimpleJScriptStart
    return HTML_JS_START
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
    return HTML_JS_END
  end


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
    return HTML_BODY_START
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
    return HTML_BODY_END
  end

  #
  #=== Overview
  #body要素のheader部分を指定の文字列で埋め込んで返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String title] headerに指定するタイトル文字列。
  #
  #@Return
  #
  #[String] 生成したbody部分のheader要素。
  #
  def createBodyHeader(title)
    return "<div id=\"my_header\"><h1>#{title}</h1></div>\n"
  end


  #
  #=== Overview
  #body要素のheader部分を指定の文字列で埋め込んで返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String title] headerに指定するタイトル文字列。
  #
  #@Return
  #
  #[String] 生成したbody部分のheader要素。
  #
  def createBodyHeader(title)
    return "<div id=\"my_header\"><h1>#{title}</h1></div>\n"
  end

  #
  #=== Overview
  #body要素のcontents部分を作成する。
  #番号のみ引数に取り、単純にidにcontainer+通番を振っていく。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Integer graph_number] このHTMLに表示するグラフ数。
  #
  #@Return
  #
  #[String] 生成したbody部分のcontents要素。
  #
  def createCommonBodyContents(graph_number)
    contents =<<-EOF
<div id="my_contents">
    <div id="mymain">
        <div class="contents">
    EOF
    graph_number.times do |i|
      contents << "<div id=\"container#{i}\" class=\"graph_contents\"></div><br><br><br>\n"
    end
    contents << "</div></div></div>\n"
    contents
  end

  #
  #=== Overview
  #body要素のcontents部分を作成する。
  #通常メニューのリンクを生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Integer graph_number] このHTMLに表示するグラフ数。
  #
  #@Return
  #
  #[String] 生成したbody部分のnavigation要素。
  #
  def createCommonBodyNavigation(group_config)
    navigation =<<-EOF
    <div id="my_navigation">
        <div id="mynavi">
            <ul>
    EOF
    ## TODO どうしようか、LINK
    group_config["sub_group_number"].times do |i|
      link_str = group_config["sub_groups"][i]["title"]
      navigation << "<li><a href=\"./graph_group.cgi?config=#{group_config["config_path"]}&sub_group_num=#{i}\">#{link_str}</a></li>\n"
    end
    navigation << "</ul>\n</div>\n</div>"

    navigation
  end

  #
  #=== Overview
  #body要素のnavigation部分を作成する。
  #BOX風のメニューを生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Integer graph_number] このHTMLに表示するグラフ数。
  #
  #@Return
  #
  #[String] 生成したbody部分のnavigation要素。
  #
  def createBoxBodyNavigation(group_config)
    navigation =<<-EOF
    <div id="my_navigation">
        <div id="mynavi">
    EOF
    group_config["sub_group_number"].times do |i|
      link_str = group_config["sub_groups"][i]["title"]
      navigation << "<div class=\"menulist\"><a href=\"./graph_group.cgi?config=#{group_config["config_path"]}&sub_group_num=#{i}\">#{link_str}</a></div>\n"
    end
    navigation << "</div>\n</div>"

    navigation
  end




##################################### グラフ生成部品 ####################################

  #
  #=== Overview
  #Highchartsスクリプト共通先頭部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Integer graph_number] 描画グラフID番号
  #
  #@Return
  #
  #[String] 生成したスクリプト開始部分
  #
  def createHCScriptStart(graph_number)
    script_start =<<-EOF
var chart#{graph_number};
$(document).ready(function () {
  chart#{graph_number} = new Highcharts.Chart({
EOF
    script_start
  end

  #
  #=== Overview
  #Highchartsスクリプト共通終了部分を生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したスクリプト開始部分
  #
  def createHCScriptEnd()
    script_end =<<-EOF
             });
        });
EOF
    script_end
  end


  #
  #=== Overview
  #Highchartsスクリプト：Basic Barタイプ用chartセクション
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Integer graph_number] 描画グラフID番号
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createChartForBasicBar(graph_id)
    mychart =<<-EOF
chart: {
    renderTo: 'container#{graph_id}',
    defaultSeriesType: 'line',
    marginRight: 130,
    marginBottom: 45
},
EOF
    mychart
  end

  #
  #=== Overview
  #Highchartsスクリプト：カラム系タイプ用chartセクション
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Integer graph_number] 描画グラフID番号
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createChartColumn(graph_id)
    mychart =<<-EOF
chart: {
    renderTo: 'container#{graph_id}',
    type: 'column'
},
EOF
    mychart
  end

  #
  #=== Overview
  #Highchartsスクリプト：PieChart用chartセクション
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Integer graph_number] 描画グラフID番号
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createChartForPieChart(graph_id)
    mychart =<<-EOF
chart: {
    renderTo: 'container#{graph_id}',
    defaultSeriesType: 'pie',
    plotBorderWidth: null,
    plotShadow: false
},
EOF
    mychart
  end


  #
  #=== Overview
  #Highchartsスクリプト：titleセクション
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String title] グラフタイトル
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createCommonTitle(title)
    mytitle =<<-EOF
title: {
    text: '#{title}'
},
EOF
    mytitle
  end


  #
  #=== Overview
  #Highchartsスクリプト：subtitleセクション
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String subtitle] グラフサブタイトル
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createCommonSubTitle(subtitle)
    mysubtitle =<<-EOF
subtitle: {
    text: '#{subtitle}'
},
EOF
    mysubtitle
  end


  #
  #=== Overview
  #Highchartsスクリプト：xAxisセクション
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Hash xAxis] xAxis設定ハッシュ値
  #[Hash args] オプション値。
  #
  #* args
  #  [String Hash=>:title] X軸タイトル
  #  [Integer Hash=>:max] X軸目盛最大値
  #  [Integer Hash=>:min] X軸目盛最小値
  #
  #* args
  #  [Boolean Hash=>:stringx] 文字列をシングルクォーテーションで　囲むかどうか。
  #  [Boolean Hash=>:datetime] type datetimeとするかどうか。
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createCommonXAxis(xAxis, args={})
    args = {
      :datetime => false
    }.merge(args)
    

    myxaxistitle =<<-EOF
xAxis: {
    title: {
        text: '#{xAxis["title"]}'
    },
EOF

    if args[:datetime]
      myxaxistitle << "type: 'datetime',\n"
    end

    if xAxis["max"] != nil
      myxaxistitle << "    max: #{xAxis["max"]},\n"
    end

    if xAxis["min"] != nil
      myxaxistitle << "    min: #{xAxis["min"]},\n"
    end

    myxaxistitle << "},\n"
  end

  #
  #=== Overview
  #対象のデータファイルから、１データを１行、
  #カラムはタブ区切りで指定の1カラム分のみデータを抽出し、
  #固定xAxis用データを生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String filepath] 取得対象ファイルパス
  #[Integer colnum] ファイル内の取得対象カラム番号
  #[Hash args] オプション値。
  #
  #* args
  #  [Boolean Hash=>:stringx] 文字列をシングルクォーテーションで　囲むかどうか。
  #  [Boolean Hash=>:datetime] type datetimeとするかどうか。
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したxAxis用文字列
  #
  def createStableXAxisFromFile(filepath, colnum, args={})
    args = {
      :stringx => false,
      :datetime => false,
      :sep => "\t"
    }.merge(args)
    
    if filepath == nil || colnum == nil
      # コンフィグ不正。
      # TODO エラーをraiseする。
      return;
    end

    _data_colnum = colnum - 1
    _sep = Regexp.new(args[:sep])
    myxaxiscolumns =<<-EOF
xAxis: {
EOF
    if args[:datetime]
      myxaxiscolumns << "    type: 'datetime',\n"
    end
    myxaxiscolumns << "categories: ["
    File.open(filepath,"r") do |rfl|
      while _line = rfl.gets
        _cols = _line.chomp!.split(_sep)
        myxaxiscolumns << "'#{_cols[_data_colnum]}', "
      end
    end
    myxaxiscolumns << "]},"
  end

  #
  #=== Overview
  #Typeに応じてX軸セクションを生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Hash xAxis_config] x軸定義コンフィグ
  #
  #* args
  #  [Integer Hash=>:colnum] データカラム（デフォルト：1）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したxAxis用文字列
  #
  def createXAxisSection(xAxis_config)
    case xAxis_config["type"]
    when "string"
      stringx = true
      datetime = false
    when "datetime"
      datetime = true
      stringx = false
    else
      stringx = false
      datetime = false
    end

    myxaxis_section = ""
    case xAxis_config["my_fmt"]  
      when "stable_from_file"
        myxaxis_section << createStableXAxisFromFile(xAxis_config["filepath"],xAxis_config["colnum"] ,:stringx => stringx ,:datetime => datetime)
      when "common"
        # title、max、minがあれば作成。全てなければ作らない。
        myxaxis_section << createCommonXAxis(xAxis_config,:datetime => datetime)
    end
    myxaxis_section
  end


  #
  #=== Overview
  #Highchartsスクリプト：yAxisセクション
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Hash yAxis] yAxis設定ハッシュ値
  #
  #* args
  #  [String Hash=>:title] Y軸タイトル
  #  [Integer Hash=>:max] Y軸目盛最大値
  #  [Integer Hash=>:min] Y軸目盛最小値
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createCommonYAxis(yAxis)
    myyaxistitle =<<-EOF
yAxis: {
    title: {
        text: '#{yAxis["title"]}'
    },
EOF
    if yAxis["max"] != nil
      myyaxistitle << "    max: #{yAxis["max"]},\n"
    end

    if yAxis["min"] != nil
      myyaxistitle << "    min: #{yAxis["min"]},\n"
    end

    myyaxistitle << "},\n"
  end

  #
  #=== Overview
  #Highchartsスクリプト：tooltipセクション。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Array graph_config] グラフ定義コンフィグ
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createToolTipSection(graph_config)
    mytooltip = ""

    case graph_config["xAxis"]["type"]
    when "datetime"
      mytooltip << createDateToolTip
    else
      mytooltip << createCommonToolTip(graph_config["xunit"],graph_config["yunit"])
    end
    mytooltip
  end

  #
  #=== Overview
  #Highchartsスクリプト：tooltipセクション。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String xUnit] x軸単位
  #[String yUnit] y軸単位
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createCommonToolTip(xUnit,yUnit)
    tooltip =<<-EOF
tooltip: {
    formatter: function () {
        return '<b>' + this.series.name + '</b><br/>' +
        this.x + '#{xUnit}: ' + this.y + '#{yUnit}';
    }
},
EOF
    tooltip
  end


  #
  #=== Overview
  #Highchartsスクリプト：tooltipセクション。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createDateToolTip
    tooltip =<<-EOF
tooltip: {
    xDateFormat: '%Y/%m/%d %H:%M:%S',
    shared: true
},
EOF
    tooltip
  end

  #
  #=== Overview
  #Highchartsスクリプト：tooltipセクション。シンプルな形式。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String xUnit] x軸単位
  #[String yUnit] y軸単位
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createSimpleToolTip(xUnit,yUnit)
    tooltip =<<-EOF
tooltip: {
    formatter: function () {
        return '' +  this.x + '#{xUnit}: ' + this.y + '#{yUnit}';
    }
},
EOF
    tooltip
  end

  #
  #=== Overview
  #Highchartsスクリプト：tooltipセクション。パーセンテージ形式用
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createPercentageToolTip
    tooltip =<<-EOF
tooltip: {
    formatter: function() {
        return ''+
          this.series.name +': '+ this.y +' ('+ Math.round(this.percentage) +'%)';
    }
},
EOF
    tooltip
  end

  #
  #=== Overview
  #Highchartsスクリプト：グラフ右エリアに出力する凡例。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String xUnit] x軸単位
  #[String yUnit] y軸単位
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createRightLegend
    rlegend =<<-EOF
legend: {
    layout: 'vertical',
    align: 'right',
    verticalAlign: 'top',
    x: -10,
    y: 100,
    borderWidth: 0
},
EOF
    rlegend
  end


  #
  #=== Overview
  #Highchartsスクリプト：plotOptionsセクション。パーセンテージ形式用
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createPercentagePlotOptions
    plotOptions =<<-EOF
plotOptions: {
    column: {
        stacking: 'percent'
    }
},
EOF
    plotOptions
  end


  #
  #=== Overview
  #Highchartsスクリプト：plotOptionsセクション。pie_chart用
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createPieChartPlotOptions
    plotOptions =<<-EOF
plotOptions: {
    pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
            enabled: true,
            color: '#FFFFFF',
            connectorColor: '#FFFAF0',
            formatter: function() {
                return '<b>'+ this.point.name +'</b>: '+ Math.round(this.percentage) +' %';
            }
        }
    }
},
EOF
    plotOptions
  end

  #
  #=== Overview
  #Highchartsスクリプト：plotOptionsセクション。pie_chart用
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createBarPlotOptions
    plotOptions =<<-EOF
plotOptions: {
    column: {
        pointPadding: 0.2,
        borderWidth: 0
    }
},
EOF
    plotOptions
  end

  #
  #=== Overview
  #Highchartsスクリプト：seriesセクション。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Array dataconfigs] データ定義コンフィグ
  #[Hash args] オプション値。
  #
  #* args
  #  [Boolead Hash=>:stringx] 最初のカラムをシングルクォーテーションで囲むかどうか（デフォルト：false）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createSeriesSection(graph_config)
    myseries = ""
    ignore_header = graph_config["ignore_header"]

    case graph_config["xAxis"]["type"]
    when "string"
      stringx = true
      datetime = false
      datefmt = nil
    when "datetime"
      stringx = false
      datetime = true
      datefmt = graph_config["xAxis"]["datefmt"]
    else
      stringx = false
      datetime = false
      datefmt = nil
    end

    if graph_config["ignore_header"]
      ignore_header = true
    else
      ignore_header = false
    end

    case graph_config["data_configs"]["my_fmt"]
    when "common"
      use_header = false
    when "use_header"
      use_header = true
    end
    
    case graph_config["xAxis"]["my_fmt"]
    when "stable_from_file"
      createSingleSeriesFromFiles(graph_config["data_configs"]["datas"], :use_header => use_header, :ignore_header => ignore_header)
    when "common"
      createMultiSeriesFromFiles(graph_config["data_configs"]["datas"], :stringx => stringx, :use_header => use_header ,:ignore_header => ignore_header,:datetime => datetime , :datefmt => datefmt)
    end

  end


  #
  #=== Overview
  #Highchartsスクリプト：seriesセクション。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Array dataconfigs] データ定義コンフィグ
  #[Hash args] オプション値。
  #
  #* args
  #  [Boolead Hash=>:stringx] 最初のカラムをシングルクォーテーションで囲むかどうか（デフォルト：false）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createMultiSeriesFromFiles(datas,args={})
    args = {
      :use_header => false,
      :ignore_header => false,
      :stringx => false,
      :datetime => false,
      :datefmt => nil
    }.merge(args)

    series =<<-EOF
series: [
EOF
    datas.each do |config|
      if !args[:use_header]
        series << "{\n  name: '#{config["name"]}',\n"
      end
      data = createMultiDataFromFile(config["filepath"],
                                     :xdata => config["xdata_colnum"],
                                     :ydata => config["ydata_colnum"],
                                     :use_header => args[:use_header],
                                     :ignore_header => args[:ignore_header],
                                     :stringx => args[:stringx],
                                     :datetime => args[:datetime],
                                     :datefmt => args[:datefmt]
                                     )
      series << data << "},\n"
    end
    series << "]\n"
    series
  end

  #
  #=== Overview
  #Highchartsスクリプト：seriesセクション。データ系列が１つのパターン。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Array datas] データコンフィグ
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createSingleSeriesFromFiles(datas, args={})
   args = {
      :use_header => false,
      :ignore_header => false
    }.merge(args)

    series =<<-EOF
series: [
EOF
    datas.each do |config|
      if !args[:use_header]
        series << "{\n  name: '#{config["name"]}',\n"
      end
      data = createSingleDataFromFile(config["filepath"],
                                      config["ydata_colnum"].to_i,
                                      :use_header => args[:use_header] ,
                                      :ignore_header => args[:ignore_header])
      series << data << "},\n"
    end
    series << "]\n"
    series
  end

  #
  #=== Overview
  #対象のデータファイルから、１データを１行、
  #カラムはタブ区切りで指定のX軸用データとY軸用データを取得して、
  #グラフ用データ文字列を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String filepath] 取得対象ファイルパス
  #[Hash args] オプション値。
  #
  #* args
  #  [Integer Hash=>:xdata] X軸データカラム（デフォルト：1）
  #  [Integer Hash=>:ydata] Y軸データカラム（デフォルト：2）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したグラフデータ用文字列
  #
  def createMultiDataFromFile(filepath, args={})
    args = {
      :xdata => 1,
      :ydata => 2,
      :use_header => false,
      :ignore_header => false,
      :stringx => false,
      :datetime => false,
      :datefmt => nil,
      :sep => "\t"
    }.merge(args)

    _xdata_colnum = args[:xdata] - 1
    _ydata_colnum = args[:ydata] - 1
    _sep = Regexp.new(args[:sep])
    retstr = ""
    first = true

    File.open(filepath,"r") do |rfl|
      while _line = rfl.gets
        _cols = _line.chomp!.split(_sep)
        if first
          first = false
          if args[:use_header]
            # Y軸側のデータを使う
            retstr << "{\n  name: '#{_cols[_ydata_colnum]}',\n"
            retstr << "data: ["
            next
          end
          retstr << "data: ["
          if args[:ignore_header]
            next
          end
        end
        if args[:stringx]
          retstr << "['#{_cols[_xdata_colnum]}', #{_cols[_ydata_colnum]}], "
        elsif args[:datetime]
          xdate = DateTime.strptime(_cols[_xdata_colnum],args[:datefmt])
          retstr << "[Date.UTC(#{xdate.year}, #{xdate.mon - 1}, #{xdate.day}, #{xdate.hour}, #{xdate.min}, #{xdate.sec}), #{_cols[_ydata_colnum]}], "
        else
          retstr << "[#{_cols[_xdata_colnum]}, #{_cols[_ydata_colnum]}], "
        end
      end
    end
    retstr << "]\n"

    retstr

  end




  #
  #=== Overview
  #対象のデータファイルから、１データを１行、
  #カラムはタブ区切りで指定の1カラム分のみデータを抽出し、
  #グラフ用データ文字列を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String filepath] 取得対象ファイルパス
  #[Hash args] オプション値。
  #
  #* args
  #  [Integer Hash=>:colnum] データカラム（デフォルト：1）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したグラフデータ用文字列
  #
  def createSingleDataFromFile(filepath, colnum, args={})
    args = {
      :use_header => false,
      :ignore_header => false,
      :sep => "\t"
    }.merge(args)
    
    _data_colnum = colnum - 1
    _sep = Regexp.new(args[:sep])
    retstr = ""
    first = true

    File.open(filepath,"r") do |rfl|
      while _line = rfl.gets
        _cols = _line.chomp!.split(_sep)
        if first
          first = false
          retstr << "data: ["
          if args[:ignore_header]
            next
          end
          if args[:use_header]
            retstr << "{\n  name: '#{_cols[_data_colnum]}',\n"
            next
          end
        end
        retstr << "#{_cols[_data_colnum]}, "
      end
    end
    retstr << "]\n"

    retstr

  end


end

