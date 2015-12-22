# 登録会社
class Company < ActiveRecord::Base
  # 担当者
  has_many :company_users
end
