require 'lib/config/graph/graph_config'
require 'lib/config/pv/page_view_config'

#
#== PageView定義コンフィグ
#
#=== Overview
#グラフコンフィグをファイルパスで読み込むタイプのPageView定義コンフィグ実装。
#
#@autor tohirano
#
class FilePathPageViewConfig < PageViewConfig

  attr_accessor :graph_config_paths          # グラフコンフィグパス配列。

  #
  #=== コンストラクタ
  #
  #@Args
  #
  #[String filepath] 当該コンフィグファイルパス。
  #
  def initialize(args={})
    # 明示的にsuperを読んで変数を継承。
    super()
    args = {
      :config_path => nil,
      :config_str => nil
    }.merge(args)

    _page_view_config = nil
    if args[:config_path] != nil
      _page_view_config = YAML.load_file(args[:config_path])
    elsif args[:config_str] != nil
      _page_view_config = YAML.load(args[:config_str])
    end

    graph_config_paths = Array.new

    if _page_view_config != nil
      @title = _page_view_config["title"]
      @description = _page_view_config["description"]
      @load_type = _page_view_config["load_type"]
      @graph_config_paths = _page_view_config["graph_configs"] if _page_view_config["graph_configs"] != nil
    end
    
  end

  #
  #=== Overview
  #当該PVに紐付くグラフコンフィグを配列形式で全LOADして返す。
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
    # 直接そのパスでインスタンスに放り込むのみ。インスタンスの内部でtypeを見て置換するかどうかを決める。
    # 尤も、グラフコンフィグのみがテンプレートになるというのはなんじゃそりゃなんだがな。
    garray = Array.new
    
    @graph_config_paths.each do |gpath|
      garray << GraphConfig.new(:config_path => gpath)
    end
    
    garray
  end

end



