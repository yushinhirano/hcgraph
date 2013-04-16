
#
#== グラフデータ系列部分の生成
#
#=== Overview
#指定されたTSV形式のファイル又は標準入力に対し、
#指定のカラムを抜き出してデータ系列用文字列として生成・返却する。
#
#@autor tohirano
#
class CreateDataFromTsv

  # X軸カラム
  attr_reader :default_sep

  #
  #=== コンストラクタ
  #
  #@Args
  #
  #  何もねぇ。Moduleでもいいくらいだな、これ。
  #
  def initialize()
    @default_sep = "\t"
  end
  
  #
  #=== Overview
  #対象のデータファイルから、１データを１行、
  #カラムはタブ区切りで指定のX軸用データとY軸用データを取得して、
  #グラフ用データ文字列を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String filepath] 取得対象ファイルパス
  #[Hash args] オプション値。
  #
  #* args
  #  [Integer Hash=>:xdata] X軸データカラム（デフォルト：1）
  #  [Integer Hash=>:ydata] Y軸データカラム（デフォルト：2）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したグラフデータ用文字列
  #
  def createDataFromFile(filepath, args={})
    args = {
      :xdata => 1,
      :ydata => 2,
      :sep => @default_sep
    }

    _xdata_colnum = args[:xdata] - 1
    _ydata_colnum = args[:ydata] - 1
    _sep = Regexp.new(args[:sep])
    retstr = "data: ["

    File.open(filepath,"r") do |rfl|
      while _line = rfl.gets
        _cols = _line.chomp!.split(_sep)
        retstr << "[#{_cols[_xdata_colnum]}, #{_cols[_ydata_colnum]}], "
      end
    end
    retstr << "]"

    retstr

  end

  #
  #=== Overview
  #標準入力から、１データを１行、
  #カラムはタブ区切りで指定のX軸用データとY軸用データを取得して、
  #グラフ用データ文字列を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Hash args] オプション値。
  #
  #* args
  #  [Integer Hash=>:xdata] X軸データカラム（デフォルト：1）
  #  [Integer Hash=>:ydata] Y軸データカラム（デフォルト：2）
  #  [String Hash=>:sep] 区切り文字（デフォルト：タブ文字列）
  #
  #@Return
  #
  #[String] 生成したグラフデータ用文字列
  #
  def createDataFromStdin(args={})
    args = {
      :xdata => 1,
      :ydata => 2,
      :sep => @default_sep
    }

    _xdata_colnum = args[:xdata] - 1
    _ydata_colnum = args[:ydata] - 1
    _sep = Regexp.new(args[:sep])
    retstr = "["

    while _line = gets
      _cols = _line.chomp!.split(_sep)
      retstr << "[[#{_cols[_xdata_colnum]}, #{_cols[_ydata_colnum]}], "
    end
    retstr << "],"

    retstr

  end


end



