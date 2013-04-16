
#
#== HTML作成ユーティリティ
#
#=== Overview
#HTML文字列を作るための部品。
#
#@autor tohirano
#
module MakeHCGraphHtmlStringUtils

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
  def createHCScriptEnd
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
  #[XAxisConfig xAxis] X軸コンフィグインスタンス
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createCommonXAxis(xAxis)    

    myxaxistitle =<<-EOF
xAxis: {
    title: {
        text: '#{xAxis.title}'
    },
EOF

    if xAxis.datetime?
      myxaxistitle << "type: 'datetime',\n"
    end

    if xAxis.max != nil
      myxaxistitle << "    max: #{xAxis.max},\n"
    end

    if xAxis.min != nil
      myxaxistitle << "    min: #{xAxis.min},\n"
    end

    myxaxistitle << "},\n"
  end

  #
  #=== Overview
  #Typeに応じてX軸セクションを生成する。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[XAxisConfig xAxis_config] X軸コンフィグインスタンス
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
    myxaxis_section = ""
    # title、max、minがあれば作成。全てなければ作らない。
    myxaxis_section << createCommonXAxis(xAxis_config)
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
  #[YAxisConfig yAxis] Y軸設定コンフィグ
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createCommonYAxis(yAxis)
    myyaxistitle =<<-EOF
yAxis: {
    title: {
        text: '#{yAxis.title}'
    },
EOF
    if yAxis.max != nil
      myyaxistitle << "    max: #{yAxis.max},\n"
    end

    if yAxis.min != nil
      myyaxistitle << "    min: #{yAxis.min},\n"
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
  #[GraphConfig graph_config] グラフ定義コンフィグ
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createToolTipSection(graph_config)
    mytooltip = ""
    
    tooltip_st =<<-EOF
tooltip: {
    EOF
    
    tooltip_ed =<<-EOF
},
    EOF
    
    mytooltip << tooltip_st
    
    # x軸がdatetimeの時の対応。
    if graph_config.xAxis.datetime?
      mytooltip << createDateToolTipPart
    end
    
    # Formatter取得
    if graph_config.stacked_percentage_column?
      mytooltip << createPercentageToolTipFormatPart
    end
    mytooltip << tooltip_ed
    mytooltip
  end

  #
  #=== Overview
  #Highchartsスクリプト：tooltipセクション。@deprecated
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
  def createCommonToolTipFormatPart(xUnit,yUnit)
    tooltip =<<-EOF
    formatter: function () {
        return '<b>' + this.series.name + '</b><br/>' +
        this.x + '#{xUnit}: ' + this.y + '#{yUnit}';
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
  def createPercentageToolTipFormatPart
    tooltip =<<-EOF
    formatter: function() {
        return ''+
          this.series.name +': '+ this.y +' ('+ Math.round(this.percentage) +'%)';
    },
EOF
    tooltip
  end


  #
  #=== Overview
  #Highchartsスクリプト：tooltipセクション。Stacked形式用。
  #上手くいかないので@deprecated。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
#  def createStackedToolTipFormatPart
 #   tooltip =<<-EOF
 #   formatter: function() {
 #     return '<b>'+ this.x +'</b><br/>'+
 #             this.series.name +': '+ this.y +'<br/>'+
 #             'Total: '+ this.point.stackTotal;
 #   },
 #   EOF
#    tooltip = ""
#  end


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
  def createDateToolTipPart
    tooltip =<<-EOF
    xDateFormat: '%Y/%m/%d %H:%M:%S',
    shared: true,
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
  #Highchartsスクリプト：plotOptionsセクション。stacked形式用
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createStackedPlotOptions
    plotOptions =<<-EOF
plotOptions: {
    column: {
        stacking: 'normal'
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
  #[GraphConfig graph_config] グラフ表示コンフィグ
  #
  #@Return
  #
  #[String] 生成スクリプトパーツ
  #
  def createSeriesSection(graph_config)
    
    series =<<-EOF
series: [
EOF
    
    if graph_config.data_config.ycolumn_range?
      # この場合は、指定カラム以降全てのカラムに対してseriesを作成する。
      # nameの仕様上強制的にuse headerとなるので注意。
      datapath = (graph_config.data_config.data_source_configs[0]).filepath
      # やりたければここでparseしよう。今のところ未対応。めんどい。
      start_ydata_colnum = (graph_config.data_config.data_source_configs[0]).ydata_colnum
      xdata_colnum =  (graph_config.data_config.data_source_configs[0]).xdata_colnum

      # 最大ループ回数を取得（カラム数のmax）
      max_colnum = 0
      first = true
      y_name = ""
      File.open(datapath,"r") do |rfl|
        while _line = rfl.gets
          # TODO sepがタブ固定・・・どっかで持つ必要があるなぁ。
          _cols = _line.chomp!.split("\t")
          if first
            # ヘッダを確保しておく。
            y_name = _cols[start_ydata_colnum - 1]
            first = false
          end
          max_colnum = _cols.size if _cols.size > max_colnum
        end
      end
      
      (max_colnum - start_ydata_colnum + 1).times do |i|
        series << "{\n  name: '#{y_name}#{i}',\n"
        # use_headerとignore_headerを固定化する。nameを事前に取っておくため。
        data = createMultiDataFromFile(datapath,
                                       :xdata => xdata_colnum,
                                       :ydata => (start_ydata_colnum + i),
                                       :use_header => false,
                                       :ignore_header => true,
                                       :stringx => graph_config.xAxis.string?,
                                       :datetime => graph_config.xAxis.datetime?,
                                       :datefmt => graph_config.xAxis.datefmt
                                       )
        series << data << "},\n"
      end
      
    else
    
      graph_config.data_config.data_source_configs.each do |config|
        if !graph_config.data_config.use_header?
          series << "{\n  name: '#{config.name}',\n"
        end
        data = createMultiDataFromFile(config.filepath,
                                       :xdata => config.xdata_colnum,
                                       :ydata => config.ydata_colnum,
                                       :use_header => graph_config.data_config.use_header?,
                                       :ignore_header => graph_config.data_config.ignore_header?,
                                       :stringx => graph_config.xAxis.string?,
                                       :datetime => graph_config.xAxis.datetime?,
                                       :datefmt => graph_config.xAxis.datefmt
                                       )
        series << data << "},\n"
      end
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

end

