module ApplicationHelper

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = { fenced_code_blocks: true }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
  
  def sortable(column, title=nil)
    title ||= column.titleize
    css_class = column == sort_column ? sort_direction == "asc" ? "current asc glyphicon glyphicon-chevron-up" : "current desc glyphicon glyphicon-chevron-down" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}, {class: css_class}
  end

end
