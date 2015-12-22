class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      # ユーザーアカウント
      t.string :account, null: false
      # ユーザーパスワード
      t.string :password_digest, null: false
      # 担当者
      t.string :name, null: false

      # パスワードを変更しているか？
      t.boolean :password_change_flg, null: false, default: false

      t.timestamps null: false
    end
  end
end
