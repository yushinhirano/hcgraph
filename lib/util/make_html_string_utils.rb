
#
#== HTML作成ユーティリティ
#
#=== Overview
#HTML文字列を作るための部品。
#
#@autor tohirano
#
module MakeHtmlStringUtils

  #
  #=== Overview
  #シンプルなHTMLの開始部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHTML開始部分。
  #
  def createSimpleHtmlStart
    <<-EOF
<!DOCTYPE html>
<html>
EOF
  end

  #
  #=== Overview
  #シンプルなHTMLの終了部分を返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #@Return
  #
  #[String] 生成したHTML終了部分
  #
  def createSimpleHtmlEnd
    <<-EOF
</html>
EOF
  end

end

