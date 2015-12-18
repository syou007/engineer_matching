# 公開用ページのルーティングは以下に記載
controller 'public/index' do
  get '/' => :index

  # ex)
  # get '/page' => :page
end
