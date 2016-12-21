require 'test_helper'

class BuyGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buy_games_index_url
    assert_response :success
  end

  test "should get show" do
    get buy_games_show_url
    assert_response :success
  end

end
