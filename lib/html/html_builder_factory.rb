require 'lib/html/home_html_builder'
require 'lib/html/graph_view_html_builder'

#
#== HeaderBuilder ファクトリー
#
#=== Overview
#HtmlBuilderクラスのファクトリー。
#
#@autor tohirano
#
class HtmlBuilderFactory

  @@home = nil
  @@graph_view = nil

  #
  #=== Overview
  #HtmlBuilderクラスを返す。
  #
  #=== Args And Return
  #
  #@Args
  #
  #[String aid] action ID
  #
  #@Return
  #
  #[HtmlBuilder] HtmlBuilderインスタンス
  #
  def HtmlBuilderFactory.getHtmlBuilder(aid)
    case aid
    when "home"
      if @@home == nil
        @@home = HomeHtmlBuilder.new
      end
      return @@home
    when "view"
      if @@graph_view == nil
        @@graph_view = GraphViewHtmlBuilder.new
      end
      return @@graph_view
    else
      raise "invalid aid => [#{aid}]"
    end

  end

end



