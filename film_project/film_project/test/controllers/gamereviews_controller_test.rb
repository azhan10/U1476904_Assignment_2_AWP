require 'test_helper'

class GamereviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gamereviews_index_url
    assert_response :success
  end

  test "should get show" do
    get gamereviews_show_url
    assert_response :success
  end

end
