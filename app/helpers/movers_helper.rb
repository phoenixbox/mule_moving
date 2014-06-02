module MoversHelper
  def icon_checkmark_or_not(boolean)
    icon = boolean ? "ok" : "remove"
    content_tag(:i, nil, class: "pull-right glyphicon glyphicon-#{icon}")
  end
end
