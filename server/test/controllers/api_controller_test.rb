require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get refresh" do
    get :refresh
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get screen" do
    get :screen
    assert_response :success
  end

end
