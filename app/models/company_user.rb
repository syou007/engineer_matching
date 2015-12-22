# 企業管理ユーザー
class CompanyUser < ActiveRecord::Base
  # 企業
  belongs_to :company

  # メールアドレス
  validates :email, presence: true, uniqueness: true, :email_format => {:message => 'の形式が誤ってます。'}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # パスワード
  validates :password,
            length: { in: 8..20, allow_blank: true },
            presence: true,
            format: { with: /\A[a-zA-Z0-9]+\z/i, allow_blank: true },
            allow_nil: true

end
