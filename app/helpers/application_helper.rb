module ApplicationHelper
  def alert_class type
    case type
    when "alert"
      "alert-danger"
    when "notice"
      "alert-success"
    else
      "alert-#{type}"
    end
  end
end
