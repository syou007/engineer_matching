class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      # 会社名
      t.string :name, null: false
      # 会社概要
      t.text :overview

      # フォローされているユーザー数
      t.integer :follow_user_count, default: 0 , null: false

      t.timestamps null: false
    end
  end

  # 検索用のミドルウェアを使用予定なので、インデックスは張らない。
end
