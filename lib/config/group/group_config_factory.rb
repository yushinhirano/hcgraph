require 'lib/config/group/file_path_group_config'
require 'lib/config/group/template_dirname_group_config'
require 'lib/config/group/template_filename_group_config'

#
#== GroupConfig ファクトリー
#
#=== Overview
#GroupConfigクラスのファクトリー。
#
#@autor tohirano
#
class GroupConfigFactory

  #
  #=== Overview
  #GroupConfigインスタンスを返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String config_path] コンフィグファイルパス
  #
  #@Return
  #
  #[GroupConfig] GroupConfigインスタンス
  #
  def GroupConfigFactory.getGroupConfig(config_path)
    if config_path == nil 
      raise "no config parameter==> [#{config_path}]" 
    else
      groupconf = YAML.load_file(config_path)
      case groupconf["load_type"]
      when  "file_path"
        return FilePathGroupConfig.new(config_path)
      when  "template_dirname"
        return TemplateDirnameGroupConfig.new(config_path)
      when  "template_filename"
        return TemplateFilenameGroupConfig.new(config_path)
      else 
        raise "invalid load_type or config_path loading ==> [#{groupconf["load_type"]}]" 
      end
    end
    
  end

end



