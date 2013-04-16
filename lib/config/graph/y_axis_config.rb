
#
#== Y軸定義コンフィグ
#
#=== Overview
#Y軸作成定義コンフィグ。
#
#@autor tohirano
#
class YAxisConfig

  attr_accessor :title                      # Y軸名
  attr_accessor :max                        # Y軸最大値
  attr_accessor :min                        # Y軸最小値
  
  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize(y_axis_config)
    @title = nil
    @max   = nil
    @min   = nil
    if y_axis_config != nil
      @title = y_axis_config["title"]
      @max   = y_axis_config["max"]
      @min   = y_axis_config["min"]
    end
  end

end



