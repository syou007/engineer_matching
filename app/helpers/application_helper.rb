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

  # マークダウンで表示する。
  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::OriginalHTML.new(filter_html: true, hard_wrap: true)
      @markdown = Redcarpet::Markdown.new(renderer, tables: true)
    end

    @markdown.render(text).html_safe
  end
end
