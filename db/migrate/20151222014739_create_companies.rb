class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      # 会社名
      t.string :name, null: false
      # 会社概要
      t.text :overview
      # 今まで参照された数
      t.integer :view_count, default: 0, null: false

      # フォローされているユーザー数
      t.integer :follow_user_count, default: 0 , null: false

      t.timestamps null: false
    end

    # 検索用のミドルウェアを使用予定なので、インデックスは張らない。

    # 企業名がURLになるので、同名の企業名は使用できない
    add_index :companies, :name, unique: true
  end
end
