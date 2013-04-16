require 'lib/config/graph/data_source_config'

#
#== Data定義コンフィグ
#
#=== Overview
#data部作成コンフィグ。
#
#@autor tohirano
#
class DataConfig

  attr_accessor :use_header                 # [Boolean] ヘッダを使ってnameを生成するかどうか。 
  attr_accessor :ignore_header              # [Boolean] ヘッダ行を無視するかどうか。（use_header=falseの場合のみ）
  
  attr_accessor :data_source_configs        # [Array] 実データの定義。
  attr_accessor :ycolumn_range              # stacked形式用の、ycolumn複数指定。
  
  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize(data_config)
    @use_header = true
    @ignore_header = false
    @data_source_configs = Array.new
    @ycolumn_range = false

    if data_config != nil
      @use_header = data_config["use_header"] if data_config["use_header"] != nil
      @ignore_header = data_config["ignore_header"] if data_config["ignore_header"] != nil
      @ycolumn_range = data_config["ycolumn_range"] if data_config["ycolumn_range"] != nil
      if data_config["datas"] != nil
        data_config["datas"].each do |data_src_cfg|
          @data_source_configs << DataSourceConfig.new(data_src_cfg)
        end
      end
    end
  end

  def use_header?
    @use_header
  end
  def ignore_header?
    @ignore_header
  end
  def ycolumn_range?
    @ycolumn_range
  end

end



