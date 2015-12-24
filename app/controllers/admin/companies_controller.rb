class Admin::CompaniesController < Admin::AdminController
  # 会社一覧
  def index
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
      render :index
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
