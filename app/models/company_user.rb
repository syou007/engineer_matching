# 企業管理ユーザー
class CompanyUser < ActiveRecord::Base
  # 企業
  belongs_to :company

  # メールアドレス
  validates :email, presence: true, :email_format => {:message => 'の形式が誤ってます。'}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validate :email_unique

  # パスワード
  validates :password,
            length: { in: 8..20, allow_blank: true },
            presence: true,
            format: { with: /\A[a-zA-Z0-9]+\z/i, allow_blank: true },
            allow_nil: true

  # 企業内でユニークなEmailとする。
  def email_unique
    if new_record? && self.errors.get(:email) == nil && CompanyUser.where(company_id: self.company_id, email: self.email).count > 0
      errors.add(:email, 'はすでに登録されています。')
    end
  end
end
