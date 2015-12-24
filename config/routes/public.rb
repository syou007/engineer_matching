# 公開用ページのルーティングは以下に記載
controller 'public/index' do
  # TOPページ
  get '/' => :index

  # 企業ページを表示
  get '/company/:name' => "company/public#index", as: :company

  # ex)
  # get '/page' => :page
end
