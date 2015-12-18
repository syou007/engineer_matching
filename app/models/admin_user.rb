# 管理画面用ユーザー
class AdminUser < ActiveRecord::Base

  # アカウント
  validates :account,
            length: { in: 5..20, allow_blank: true},
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9\-_]+\z/i, allow_blank: true }

  # パスワード
  validates :password,
            length: { in: 8..20, allow_blank: true },
            presence: true,
            format: { with: /\A[a-zA-Z0-9]+\z/i, allow_blank: true },
            allow_nil: true

  # ログイン用
  has_secure_password
end
