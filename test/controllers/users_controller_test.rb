require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create--no-test-framework" do
    get :create--no-test-framework
    assert_response :success
  end

end
