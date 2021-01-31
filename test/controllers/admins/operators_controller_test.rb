require 'test_helper'

class Admins::OperatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_operators_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_operators_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_operators_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_operators_edit_url
    assert_response :success
  end

end
