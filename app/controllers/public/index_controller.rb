class Public::IndexController < ApplicationController
  def index
  end

  # 存在しないページにアクセスされた場合はTOPページにリダイレクトする。
  def redirect_top
    redirect_to root_url
  end
end
