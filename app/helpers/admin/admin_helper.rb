module Admin::AdminHelper
  # ログインをしているか？
  def admin_login?
    @login_admin_user
  end

  # アクティブリンクを付ける
  def active_class(controller = nil, action = nil, attr: "")
    controller ||= controller_name
    action ||= action_name
    return "active #{attr}" if action_name == action.to_s && controller.to_s == controller_name
    attr
  end
end
