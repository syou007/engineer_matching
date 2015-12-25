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
      # 担当者の紹介文
      t.text :overview

      # 管理者が作成したユーザーは企業側では削除できません。
      t.boolean :admin_flg, default: false, null: false

      t.timestamps null: false
    end

    # 企業内でメールアドレスは重複させない。
    add_index :company_users, [:company_id, :email], unique: true
  end
end
