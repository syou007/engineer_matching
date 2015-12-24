# 管理画面で扱う会社情報です。
class Admin::CompaniesController < Admin::AdminController
  # 会社一覧
  def index
    @companies = Company.includes(:company_users).page(params[:page])
  end

  # 会社登録
  def new
    @company = Company.new
  end

  # 会社作成
  def create
    @company = Company.new(company_params)

    if params[:back].present?
      # 戻る処理
      @company.confirming = false
      render :new
    elsif @company.save
      # 保存処理
      redirect_to({action: :index}, flash: {info: "登録しました"})
    else
      # 確認画面
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :overview, :confirming)
  end
end
