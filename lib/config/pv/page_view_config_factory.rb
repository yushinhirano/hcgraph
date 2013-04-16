require 'lib/config/pv/file_path_page_view_config'
require 'lib/config/pv/template_filename_page_view_config'

#
#== PageViewConfig ファクトリー
#
#=== Overview
#PageViewConfigクラスのファクトリー。
#
#@autor tohirano
#
class PageViewConfigFactory

  #
  #=== Overview
  #PageViewConfigインスタンスを返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String config_path] コンフィグパス
  #
  #@Return
  #
  #[PageViewConfig] PageViewConfigインスタンス
  #
  def PageViewConfigFactory.getPageViewConfig(args={})
    args = {
      :config_path => nil,
      :config_str => nil
    }.merge(args)

    _pvconf = nil
    if args[:config_path] != nil
      _pvconf = YAML.load_file(args[:config_path])
    elsif args[:config_str] != nil
      _pvconf = YAML.load(args[:config_str])
    else
      raise "no loadable config==> [#{args[:config_path]}, #{args[:config_str]}]"
    end

    case _pvconf["load_type"]
    when  "file_path"
      return FilePathPageViewConfig.new(args)
    when "template_filename"
      return TemplateFilenamePageViewConfig.new(args)
    else
      raise "invalid load_type or config_path loading ==> [#{_pvconf["load_type"]}]"
    end
  end

end



