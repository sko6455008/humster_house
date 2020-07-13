require 'test_helper'

class HumstersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get humsters_index_url
    assert_response :success
  end

  test "should get show" do
    get humsters_show_url
    assert_response :success
  end

  test "should get new" do
    get humsters_new_url
    assert_response :success
  end

  test "should get edit" do
    get humsters_edit_url
    assert_response :success
  end

end
