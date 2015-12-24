# 登録会社
class Company < ActiveRecord::Base
  # 担当者
  has_many :company_users

  # 企業名
  validates :name,
            length: { in: 2..250, allow_blank: true },
            presence: true,
            allow_nil: true

  # 確認画面表示用
  include CheckConfirming

  # 標準は更新順
  default_scope {order(updated_at: :desc)}

end
