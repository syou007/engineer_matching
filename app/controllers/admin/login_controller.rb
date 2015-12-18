class Admin::LoginController < Admin::AdminController

  # ログインチェックを一部スキップさせる。
  skip_before_action :login_check, only: [:index, :login]

  # ログイン画面
  def index
  end

  # ログイン処理
  def login
    user = AdminUser.find_by_account params[:account]
    if user && user.authenticate(params[:password])
      session[:admin_login_id] = user.id
      # パスワードを変更していない場合はパスワード変更画面に遷移させる。
      if user.password_change_flg
        redirect_to admin_top_url
      else
        redirect_to admin_top_url
        # redirect_to({action: :password}, flash: {warn: "初期パスワードのままです。変更してください。"})
      end
    else
      redirect_to({action: :index}, flash: {danger: "認証に失敗しました。"})
    end
  end

  # ログアウト処理
  def logout
    reset_session
    redirect_to admin_url
  end
end
