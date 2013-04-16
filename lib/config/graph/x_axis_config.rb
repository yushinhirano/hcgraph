
#
#== X軸定義コンフィグ
#
#=== Overview
#X軸作成定義コンフィグ。
#
#@autor tohirano
#
class XAxisConfig

  attr_accessor :type                       # X軸データタイプ。string、date、default。
  attr_accessor :datefmt                    # Dateタイプの場合の日付フォーマット
  attr_accessor :title                      # X軸名

  attr_accessor :max                        # X軸最大値。実装はしてあるがどのコンフィグでも使ってない。
  attr_accessor :min                        # X軸最小値。実装はしてあるがどのコンフィグでも使ってない。

  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize(x_axis_config)
    @type = nil
    @datefmt = nil
    @title = nil

    @max = nil
    @min = nil

    if x_axis_config != nil
      @type = x_axis_config["type"]
      @datefmt = x_axis_config["datefmt"]
      @title = x_axis_config["title"]

      @max = x_axis_config["max"]
      @min = x_axis_config["min"]
    end
  end

  #
  #=== Overview
  #このX軸がdatetime型かどうかを返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[Boolean] datetimeならtrue、それ以外ならfalse
  #
  def datetime?
    @type == "datetime"
  end

  #
  #=== Overview
  #このX軸がstring型かどうかを返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[Boolean] datetimeならtrue、それ以外ならfalse
  #
  def string?
    @type == "string"
  end


end



