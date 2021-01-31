require 'test_helper'

class Operators::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get –skip-route" do
    get operators_orders_–skip-route_url
    assert_response :success
  end

  test "should get index" do
    get operators_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get operators_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get operators_orders_edit_url
    assert_response :success
  end

end
