
#
#== Group定義コンフィグ
#
#=== Overview
#Group定義コンフィグ抽象クラス。Rubyにはないから形だけ。
#こういう場合Java脳で作ってしまうけど、作らないのが普通なのだろうか。
#
#@autor tohirano
#
class GroupConfig

  # これらの変数を子クラスのinitializeでセットすること。
  # 残りのパラメータは自由に。
  attr_accessor :ggid                       # 当該グループID。
  attr_accessor :title                      # title。
  attr_accessor :default_gpid               # デフォルト表示のgpid
  attr_accessor :load_type                  # pvconfig読み込み形式。templateかfile_pathか。
  attr_accessor :page_view_gpids            # gpid配列。表示順保持のため。ここまではinitializeで確定させる。（でないとdefault_gpidが解らんゆえに）
  
  
  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize()
    @ggid = nil
    @title = nil
    @default_gpid = nil
    @page_view_gpids = nil
    @page_view_gpids = Array.new
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
  
  end

end



