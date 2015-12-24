# システム管理画面(ログイン用URLを推測できないようにEnvに切り出す。)
namespace :company, path: ENV['COMPANY_SYSTEM_URL'] do

  # 企業情報
  # resources :companies, except: [:index]
end