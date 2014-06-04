module MoversHelper
  def icon_checkmark_or_not(value)
    icon = if value
             "ok"
           elsif value.nil?
             "question-sign"
           else
             "remove"
           end

    content_tag(:i, nil, class: "pull-right glyphicon glyphicon-#{icon}")
  end
end
