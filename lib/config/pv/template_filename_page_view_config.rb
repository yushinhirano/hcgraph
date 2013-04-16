require 'lib/config/graph/graph_config'
require 'lib/config/pv/page_view_config'

require 'lib/util/my_file_utils'

#
#== PageView定義コンフィグ
#
#=== Overview
#グラフコンフィグをテンプレートを使ってファイル名を元に置換して読み込むタイプのPageView定義コンフィグ実装。
#
#@autor tohirano
#
class TemplateFilenamePageViewConfig < PageViewConfig

  include MyFileUtils

  attr_accessor :template_config_path    # テンプレートグラフコンフィグ
  attr_accessor :template_config_orig    # テンプレートグラフコンフィグ文字列(オリジナル)  

  attr_accessor :source_dir_path         # テンプレートの置換に使用するファイル一覧取得元ディレクトリ
  attr_accessor :target_path_list        # source_dir_pathから取得したファイルパス配列
  attr_accessor :target_name_list        # source_dir_pathから取得したファイル名配列

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

    @title = _page_view_config["title"]
    @description = _page_view_config["description"]
    @load_type = _page_view_config["load_type"]

    @template_config_path = _page_view_config["template_config_path"]
    @template_config_orig = getFileContentsString(@template_config_path)

    @source_dir_path = _page_view_config["source_dir_path"]
    @target_path_list = getFilepathList(@source_dir_path)
    @target_name_list = getBaseNames(@target_path_list)
    
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
    gconfs = Array.new

    # 変換しつつコンフィグを生成する。
    @target_name_list.size.times do |i|
      _convertInfo = Hash.new
      _convertInfo['${name}'] = @target_name_list[i]
      _convertInfo['${path}'] = @target_path_list[i]
      _new_yaml = convertStrs(@template_config_orig, _convertInfo)
      _gconf = GraphConfig.new(:config_str => _new_yaml)
      # グラフIDはこちらの連番で置き換え。
      _gconf.graph_id = i
      gconfs << _gconf
      
    end
    gconfs

  end

end



