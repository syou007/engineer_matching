require 'rails_helper'

RSpec.describe Admin::LoginController, type: :controller do

  # ログイン画面にアクセスできる事
  describe "ログイン画面へのアクセス" do
    it "正常にアクセスできる事" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  # ログインに成功する事
  describe "ログイン処理" do
    describe "失敗" do

      # 検査項目は全て同じ
      after do
        expect(response).to redirect_to admin_url
        expect(session[:admin_login_id]).to be_nil
      end

      it "未入力による失敗テスト" do
        post :login
      end
      it "ミスマッチによる失敗テスト1" do
        post :login, account: :admin, password: :test
      end
      it "ミスマッチによる失敗テスト1" do
        post :login, account: :admin1, password: :testtest
      end
    end
    it "成功テスト" do
      post :login, account: :admin, password: :testtest
      expect(response).to redirect_to admin_top_url
      # セッションに値が入っている事
      expect(session[:admin_login_id]).not_to be_nil
    end
  end

end
