
#
#== PageView定義コンフィグ
#
#=== Overview
#PageView定義コンフィグ抽象クラス。
#
#@autor tohirano
#
class PageViewConfig

  # これらの変数を子クラスのinitializeでセットすること。
  # 残りのパラメータは自由に。
  attr_accessor :title                      # title。
  attr_accessor :description                # description表示。
  attr_accessor :load_type                  # graphconfig読み込み形式。templateかfile_pathか。
  
  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize()
    @title = nil
    @description = nil
    @load_type = nil
  end
  
  #
  #=== Overview
  #このPVに紐付くグラフコンフィグを配列形式で全LOADして返す。
  #インスタンス生成時点ではLOADせず、このメソッド呼び出し時にLOADすること。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[Array] GraphConfigインスタンス配列
  #
  #
  def getGraphConfigs
    
  end

end



