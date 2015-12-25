class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # PC/スマホ切り替え
  before_action :detect_devise_variant

  private

  # PC/スマホを切り替えます。
  def detect_devise_variant
    # とりあえず、全てのスマホをspとする。
    request.variant = :sp if sp?
  end

  # スマートフォン判定メソッド
  def sp?
    request.user_agent =~ /iPhone|iPod|Android/
  end
  helper_method :sp?

end
