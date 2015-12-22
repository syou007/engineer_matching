class Admin::CompaniesController < Admin::AdminController
  # 会社一覧
  def index
  end

  # 会社登録
  def new
    @company = Company.new
  end
end
