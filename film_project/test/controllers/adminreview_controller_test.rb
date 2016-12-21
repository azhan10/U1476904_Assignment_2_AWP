require 'test_helper'

class AdminreviewControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adminreview_show_url
    assert_response :success
  end

  test "should get new" do
    get adminreview_new_url
    assert_response :success
  end

  test "should get edit" do
    get adminreview_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get adminreview_destroy_url
    assert_response :success
  end

  test "should get create" do
    get adminreview_create_url
    assert_response :success
  end

  test "should get index" do
    get adminreview_index_url
    assert_response :success
  end

end
