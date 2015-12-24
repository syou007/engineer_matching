class Admin::AdminController < ApplicationController

  # ログインチェック
  before_action :login_check

  # ログイン直後
  def top
    # 現在の登録会社数などを表示する予定
    @company_count = Company.count
  end

  private

  # ログインチェックを行う。
  def login_check
    @login_admin_user = AdminUser.find_by_id(session[:admin_login_id])
    redirect_to admin_url unless @login_admin_user
  end

end
