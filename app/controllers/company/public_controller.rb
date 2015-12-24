# 企業の登録ページを表示するためのコントローラー
# このコントローラーは外部公開されてます。
class Company::PublicController < ApplicationController
  # 名前とマッチした会社情報を表示します。
  def index
    # 会社情報を取得します。
    @company = Company.find_by_name(params[:name])

    # 存在しない場合はTOPページを表示
    redirect_to root_url unless @company
    # レイアウトはフロントと同じにする。
    render layout: "application"
  end
end
