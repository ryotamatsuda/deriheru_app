require 'test_helper'

class Operators::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get operators_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get operators_customers_show_url
    assert_response :success
  end

  test "should get new" do
    get operators_customers_new_url
    assert_response :success
  end

  test "should get edit" do
    get operators_customers_edit_url
    assert_response :success
  end

end
