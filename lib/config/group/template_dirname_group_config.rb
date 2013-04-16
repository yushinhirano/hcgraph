require 'lib/config/group/group_config'
require 'lib/config/pv/page_view_config_factory'

require 'lib/util/my_file_utils'

#
#== Group定義コンフィグ
#
#=== Overview
#PVコンフィグをディレクトリパステンプレート指定でLOADするGroup定義コンフィグ実装。
#
#@autor tohirano
#
class TemplateDirnameGroupConfig < GroupConfig

  include MyFileUtils

  attr_accessor :template_config_path    # テンプレートPVコンフィグ
  attr_accessor :template_config_orig    # テンプレートPVコンフィグ文字列(オリジナル)  

  attr_accessor :source_dir_path         # テンプレートの置換に使用するファイル一覧取得元ディレクトリ
  attr_accessor :target_path_list        # source_dir_pathから取得したディレクトリパス配列
  attr_accessor :target_name_list        # source_dir_pathから取得したディレクトリ名配列


  #
  #=== コンストラクタ
  #
  #@Args
  #
  #[String filepath] 当該コンフィグファイルパス。
  #
  def initialize(filepath)
    # 明示的にsuperを読んで変数を継承。
    super()
    page_view_config_paths = Hash.new

    _group_config = nil
    if filepath != nil
      _group_config = YAML.load_file(filepath)
    else
      raise "no group_config file = [#{filepath}]"
    end

    @ggid = _group_config["ggid"]
    @title = _group_config["title"]
    @load_type = _group_config["load_type"]

    @template_config_path = _group_config["template_config_path"]
    @template_config_orig = getFileContentsString(@template_config_path)

    @source_dir_path = _group_config["source_dir_path"]
    @target_path_list = getDirpathList(@source_dir_path)
    @target_name_list = getBaseNames(@target_path_list)

    @default_gpid = @target_name_list[0] if @target_name_list != nil && @target_name_list.size > 0
    @page_view_gpids = @target_name_list
    
  end

  #
  #=== Overview
  #gpidに指定されたpage_viewコンフィグをロードして返す。
  #これを子クラスで実装すること。
  #レスポンスタイムのため、インスタンス生成時点ではloadせず、このメソッド呼び出し時点でloadする。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String gpid] ページビューID。
  #
  #@Return
  #
  #[PageViewConfig] PVConfigインスタンス
  #
  #
  def getPVConfig(gpid)
    _convertInfo = Hash.new
    _convertInfo['${name}'] = gpid
    _path = nil
    @target_name_list.size.times do |i|
      if @target_name_list[i] == gpid
        _path = @target_path_list[i]
        break
      end
    end
    _convertInfo['${path}'] = _path
    _new_yaml = convertStrs(@template_config_orig, _convertInfo)
    # とはいえ、ほとんどファクトリにお任せなのだが。ここで他の実装クラスと分けるのは、パスの指定パラメータが異なるため。
    PageViewConfigFactory::getPageViewConfig(:config_str => _new_yaml)
  end

end



