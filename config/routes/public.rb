# 公開用ページのルーティングは以下に記載
controller 'public/index' do
  # TOPページ
  get '/' => :index

  # 企業ページを表示
  get '/company/:name' => "company/public#index", as: :company

  # ex)
  # get '/page' => :page
end

# Markdown用
controller 'public/markdown' do
  # Markdown変換用
  post '/markdown/preview' => :preview, as: :markdown_preview
end
