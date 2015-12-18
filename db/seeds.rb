# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 管理ユーザーを作成します。
AdminUser.create(account: "admin", password: "testtest", password_confirmation: "testtest", name: "admin") if AdminUser.count == 0