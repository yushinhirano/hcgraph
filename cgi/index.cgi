#!/usr/bin/ruby

require 'cgi'
require 'yaml'

#共通設定
$KCODE = "UTF8"
#$:.unshift File.dirname(__FILE__) + "/.."
$:.unshift Dir.pwd + "/.."
#puts "Content-Type: text-html"
puts "Content-type:text/html"
puts ""
# ---- ここまでデフォ

#require '../lib/html/html_builder_factory'
require 'lib/html/html_builder_factory'

# 現在のAidをグローバルにセット。この場合はhomeのみでOK。
$currentAid = "home"

# 画面表示全体コンフィグ（固定）を読み込む
require 'lib/config/all_view/all_view_config'
all_view_config = AllViewConfig.new("../conf/all_view_index.conf.yaml")
#all_view_config = YAML.load_file("../conf/all_view_index.conf.yaml")

# リターンHTMLの生成。
html_builder = HtmlBuilderFactory::getHtmlBuilder($currentAid)
html = html_builder.build(all_view_config)

puts html

