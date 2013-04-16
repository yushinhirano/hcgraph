require 'lib/config/group/group_config'
require 'lib/config/pv/page_view_config_factory'

#
#== Group定義コンフィグ
#
#=== Overview
#Group定義コンフィグ実装。
#
#@autor tohirano
#
class FilePathGroupConfig < GroupConfig

  attr_accessor :page_view_config_paths          # gpidをキーにしたpvconfigパスのハッシュ。

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
    @default_gpid = _group_config["default_gpid"]
    @load_type = _group_config["load_type"]
    @page_view_gpids = _group_config["page_view_gpids"] if _group_config["page_view_gpids"] != nil
    @page_view_config_paths =  _group_config["page_views"] if _group_config["page_views"] != nil
    
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
    # とはいえ、ほとんどファクトリにお任せなのだが。ここで他の実装クラスと分けるのは、パスの指定パラメータが異なるため。
    PageViewConfigFactory::getPageViewConfig(:config_path => @page_view_config_paths[gpid])
  end

end



