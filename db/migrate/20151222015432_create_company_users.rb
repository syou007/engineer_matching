class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      # 企業ID
      t.integer :company_id, null: false
      # ログインID(メールアドレス)
      t.string :email, null: false
      # パスワード
      t.string :password_digest, null: false
      # 担当者
      t.string :name

      t.timestamps null: false
    end

    # メールアドレスが重複することは無いはず。
    add_index :company_users, :email, unique: true
  end
end
