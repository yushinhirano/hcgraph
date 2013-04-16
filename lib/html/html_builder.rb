
#
#== HTML全体作成
#
#=== Overview
#<html>〜</html>までの作成を担当する。
#
#@autor tohirano
#
class HtmlBuilder

  #
  #=== コンストラクタ
  #
  #@Args
  #
  def initialize()
  end
  
  #
  #=== Overview
  #HTML全体の作成
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Hash group_config] HTML生成グループコンフィグ。
  #
  #* group_config
  #  [Integer Hash=>:xdata] X軸データカラム（デフォルト：1）
  #  [Integer Hash=>:ydata] Y軸データカラム（デフォルト：2）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したHTML文字列
  #
  def build(group_config)
  end

end



