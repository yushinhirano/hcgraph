
#
#== ファイル操作ユーティリティ
#
#=== Overview
#ファイルリストやディレクトリリストに関するユーティリティメソッド群。
#
#@autor tohirano
#
module MyFileUtils

  #
  #=== Overview
  #指定ディレクトリに対し、その１階層下から「ファイル」のみ取得して、そのパスを配列で返す。
  #配列はそのファイル名のみでソートしておく。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String dirpath] 指定ディレクトリパス
  #
  #@Return
  #
  #[Array<String>] ファイルパス配列。
  #
  def getFilepathList(dirpath)
    myfiles = Array.new
    Dir.glob( "#{dirpath}/*" ) do |filepath|
      if File::ftype(filepath) == "file"
        myfiles << filepath
      end
    end
    sorted_myfiles = myfiles.sort do |sfile,ofile|
      self_name = File::basename(sfile)
      other_name = File::basename(ofile)
      self_name <=> other_name
    end
    sorted_myfiles
  end

  #
  #=== Overview
  #指定ディレクトリに対し、その１階層下から「ファイル」のみ取得して、そのパスを配列で返す。
  #配列はそのディレクトリ名のみでソートしておく。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String dirpath] 指定ディレクトリパス
  #
  #@Return
  #
  #[Array<String>] ファイルパス配列。
  #
  def getDirpathList(dirpath)
    mydirs = Array.new
    Dir.glob( "#{dirpath}/*" ) do |dpath|
      if File::ftype(dpath) == "directory"
        mydirs << dpath
      end
    end
    sorted_mydirs = mydirs.sort do |sfile,ofile|
      self_name = File::basename(sfile)
      other_name = File::basename(ofile)
      self_name <=> other_name
    end
    sorted_mydirs
  end


  #
  #=== Overview
  #ファイルパス配列に対し、各要素からファイル名を抽出した配列を生成して返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[Array<String> filepaths] 指定ファイルパス配列。
  #
  #@Return
  #
  #[Array<String>] 抽出したファイル名配列。
  #
  def getBaseNames(filepaths)
    myfilenames = Array.new
    filepaths.each do |fpath|
      myfilenames << File::basename(fpath)
    end
    myfilenames
  end


  #
  #=== Overview
  #指定ファイルパスの内容を読み込んで、文字列として返す。実はメソッドにするまでもないんだが。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String filepath] 読み込み対象ファイルパス。
  #
  #@Return
  #
  #[String] ファイル内容。
  #
  def getFileContentsString(filepath)
    contents = ""
    File::open(filepath) do |myfile|
      contents = myfile.read
    end
    contents
  end


  #
  #=== Overview
  #指定の文字列を変換する。
  #変換情報はconvertInfoに、key：返還前、val:変換後の形式のHashとして引き渡すこと。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String targetStr] 変換対象文字列
  #[Hash convertInfo] 変換情報
  #
  #@Return
  #
  #[String] 変換後文字列
  #
  def convertStrs(targetStr,convertInfo)
    retstr = targetStr
    convertInfo.each do |src,dest|
      retstr = retstr.gsub(src,dest)
    end
    retstr
  end
end

