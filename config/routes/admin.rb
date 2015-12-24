# システム管理画面(ログイン用URLを推測できないようにEnvに切り出す。)
namespace :admin, path: ENV['SYSTEM_URL'] do
  # ログインページ
  get '/' => "login#index"
  post 'login' => "login#login"
  delete '/' => "login#logout"

  # ログイン直後のページ
  get 'top' => "admin#top"

  # 企業情報
  resources :companies
end