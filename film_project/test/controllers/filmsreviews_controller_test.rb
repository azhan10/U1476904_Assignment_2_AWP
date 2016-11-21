require 'test_helper'

class FilmsreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @filmsreview = filmsreviews(:one)
  end

  test "should get index" do
    get filmsreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_filmsreview_url
    assert_response :success
  end

  test "should create filmsreview" do
    assert_difference('Filmsreview.count') do
      post filmsreviews_url, params: { filmsreview: { filmtitle: @filmsreview.filmtitle, rating: @filmsreview.rating, review: @filmsreview.review } }
    end

    assert_redirected_to filmsreview_url(Filmsreview.last)
  end

  test "should show filmsreview" do
    get filmsreview_url(@filmsreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_filmsreview_url(@filmsreview)
    assert_response :success
  end

  test "should update filmsreview" do
    patch filmsreview_url(@filmsreview), params: { filmsreview: { filmtitle: @filmsreview.filmtitle, rating: @filmsreview.rating, review: @filmsreview.review } }
    assert_redirected_to filmsreview_url(@filmsreview)
  end

  test "should destroy filmsreview" do
    assert_difference('Filmsreview.count', -1) do
      delete filmsreview_url(@filmsreview)
    end

    assert_redirected_to filmsreviews_url
  end
end
