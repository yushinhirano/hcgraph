require 'lib/config/group/group_config_factory'

#
#== AllView定義コンフィグ
#
#=== Overview
#AllView定義コンフィグ実装。
#
#@autor tohirano
#
class AllViewConfig

  # これらの変数を子クラスのinitializeでセットすること。
  attr_accessor :title                      # title。
  attr_accessor :action_cgi                 # action_cgi。
  attr_accessor :default_aid                # デフォルト表示のaid
  attr_accessor :nav_view                   # ナビゲーションバーに表示するname,aidのハッシュ。
  attr_accessor :graph_view_aid             # グラフ表示メイン画面に使用するaid
  attr_accessor :view_group_ggids           # ggid配列。表示順保持のため。
  attr_accessor :view_group_config_paths    # view_groupコンフィグパス配列。
  
  #
  #=== コンストラクタ
  #
  #@Args
  #
  #[String filepath] 当該コンフィグファイルパス。
  #
  def initialize(filepath)
    @title = nil
    @action_cgi = nil
    @default_aid = nil
    @nav_view = Array.new
    @graph_view_aid = nil
    @view_group_ggids = Array.new
    @view_group_config_paths = Array.new

    _all_view_config = nil
    if filepath != nil
      _all_view_config = YAML.load_file(filepath)
    else
      raise "no all_view_config file = [#{filepath}]"
    end
    
    @title = _all_view_config["title"]
    @action_cgi = _all_view_config["action_cgi"]
    @default_aid = _all_view_config["default_aid"]
    @nav_view = _all_view_config["nav_view"] if _all_view_config["nav_view"] != nil
    @graph_view_aid = _all_view_config["graph_view_aid"]
    @view_group_ggids = _all_view_config["view_group_ggids"] if _all_view_config["view_group_ggids"] != nil
    @view_group_config_paths = _all_view_config["view_groups"] if _all_view_config["view_groups"] != nil

  end
  
  
  #
  #=== Overview
  #ggidに指定されたgroupコンフィグをロードして返す。
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
  #[GroupConfig] GroupConfigインスタンス
  #
  def getGroupConfig(ggid)
    # とはいえ、ほとんどファクトリにお任せなのだが。ここで他の実装クラスと分けるのは、パスの指定パラメータが異なるため。
    # また、groupconfigはfilepath以外に対応する予定なし。こいつには必要ないだろう。
    GroupConfigFactory::getGroupConfig(@view_group_config_paths[ggid])
  end

end



