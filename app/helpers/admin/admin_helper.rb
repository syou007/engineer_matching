module Admin::AdminHelper
  # ログインをしているか？
  def admin_login?
    @login_admin_user
  end
end
