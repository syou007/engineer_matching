require 'test_helper'

class Public::IndexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
