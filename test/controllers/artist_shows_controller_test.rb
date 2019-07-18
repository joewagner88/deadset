require 'test_helper'

class ArtistShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist_show = artist_shows(:one)
  end

  test "should get index" do
    get artist_shows_url
    assert_response :success
  end

  test "should get new" do
    get new_artist_show_url
    assert_response :success
  end

  test "should create artist_show" do
    assert_difference('ArtistShow.count') do
      post artist_shows_url, params: { artist_show: {  } }
    end

    assert_redirected_to artist_show_url(ArtistShow.last)
  end

  test "should show artist_show" do
    get artist_show_url(@artist_show)
    assert_response :success
  end

  test "should get edit" do
    get edit_artist_show_url(@artist_show)
    assert_response :success
  end

  test "should update artist_show" do
    patch artist_show_url(@artist_show), params: { artist_show: {  } }
    assert_redirected_to artist_show_url(@artist_show)
  end

  test "should destroy artist_show" do
    assert_difference('ArtistShow.count', -1) do
      delete artist_show_url(@artist_show)
    end

    assert_redirected_to artist_shows_url
  end
end
