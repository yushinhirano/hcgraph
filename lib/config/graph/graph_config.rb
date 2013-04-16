require 'lib/config/graph/data_config'
require 'lib/config/graph/x_axis_config'
require 'lib/config/graph/y_axis_config'

#
#== Graph定義コンフィグ
#
#=== Overview
#Graph定義コンフィグ実装クラス。
#
#@autor tohirano
#
class GraphConfig

  attr_accessor :type                       # グラフタイプ
  attr_accessor :title                      # グラフタイトル
  attr_accessor :config_type                # このコンフィグのタイプ。templateなら置き換え有効。（実は読み込む必要なし）
  attr_accessor :description                # description表示。
  attr_accessor :graph_id                   # [Integer] グラフID。
  attr_accessor :ignore_header              # [Boolean] data部作成時に、1行目をヘッダ行として無視するかどうか。
  attr_accessor :xAxis                      # [XAxisConfig] X軸に関するパラメータ。
  attr_accessor :yAxis                      # [YAxisConfig] Y軸に関するパラメータ。
  attr_accessor :data_config                # [DataConfig]  data部作成に関するコンフィグ。

  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize(args={})
    args = {
      :config_path => nil,
      :config_str => nil
    }.merge(args)

    @type = nil
    @title = nil
    @config_type = nil
    @description = nil
    @graph_id = nil
    @ignore_header = false
    @xAxis = XAxisConfig.new(nil)
    @yAxis = YAxisConfig.new(nil)
    @data_config = DataConfig.new(nil)

    _graph_config = nil
    if args[:config_path] != nil
      _graph_config = YAML.load_file(args[:config_path])
    elsif args[:config_str] != nil
      _graph_config = YAML.load(args[:config_str])
    end

    if _graph_config != nil
      @type = _graph_config["type"]
      @title = _graph_config["title"]
      @config_type =  _graph_config["config_type"]
      @description = _graph_config["description"]
      @graph_id = _graph_config["graph_id"]
      # 空のインスタンス２重作成にはしたくないので、引数チェックしてnilなら初期化のままにとどめる。
      @xAxis = XAxisConfig.new(_graph_config["xAxis"]) if _graph_config["xAxis"] != nil
      @yAxis = YAxisConfig.new(_graph_config["yAxis"]) if _graph_config["yAxis"] != nil
      @data_config = DataConfig.new(_graph_config["data_config"]) if _graph_config["data_config"] != nil
    end
    
  end

  #
  #=== Overview
  #このグラフがstacked_percentage_column形式かどうかを返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[Boolean] stacked_percentage_columnならtrue、それ以外ならfalse
  #
  def stacked_percentage_column?
    @type == "stacked_percentage_column"
  end


end



