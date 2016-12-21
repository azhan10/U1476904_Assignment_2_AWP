require 'test_helper'

class AdmingamesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admingames_show_url
    assert_response :success
  end

  test "should get new" do
    get admingames_new_url
    assert_response :success
  end

  test "should get edit" do
    get admingames_edit_url
    assert_response :success
  end

end
