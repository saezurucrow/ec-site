require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carts_show_url
    assert_response :success
  end

  test "should get buy" do
    get carts_buy_url
    assert_response :success
  end

  test "should get result" do
    get carts_result_url
    assert_response :success
  end

end
