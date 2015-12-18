module ApplicationHelper

  # メッセージの種別によって振り分けて表示します。
  # success => alert-success
  # info => alert-info
  # alert, warn => alert-warning
  # danger, error => alert-danger
  def flash_message
    message = nil
    tag = nil
    {
        success: "alert-success",
        info: "alert-info",
        alert: "alert-warning",
        warn: "alert-warning",
        danger: "alert-danger",
        error: "alert-danger",
    }.each { |key ,value|
      if flash[key]
        message = flash[key]
        tag = value
        break
      end
    }
    "<div class='alert #{tag}' role='alert'>#{message}</div>".html_safe if message
  end

end
