
#
#== Dataソース定義コンフィグ
#
#=== Overview
#dataソースコンフィグ。
#
#@autor tohirano
#
class DataSourceConfig

  attr_accessor :filepath                   # ファイルパス
  attr_accessor :name                       # ヘッダを使わない場合には、直接ここにnameを指定する。ほぼ@deprecated。
  attr_accessor :xdata_colnum               # x軸カラム番号
  attr_accessor :ydata_colnum               # y軸カラム番号
  
  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize(data_source_config)
    @filepath = nil
    @name = nil
    @xdata_colnum = nil
    @ydata_colnum = nil

    if data_source_config != nil
      @filepath = data_source_config["filepath"]
      @name = data_source_config["name"]
      @xdata_colnum = data_source_config["xdata_colnum"]
      @ydata_colnum = data_source_config["ydata_colnum"]
    end
  end
end



