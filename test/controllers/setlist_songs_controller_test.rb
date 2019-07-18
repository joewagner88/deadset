require 'test_helper'

class SetlistSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setlist_song = setlist_songs(:one)
  end

  test "should get index" do
    get setlist_songs_url
    assert_response :success
  end

  test "should get new" do
    get new_setlist_song_url
    assert_response :success
  end

  test "should create setlist_song" do
    assert_difference('SetlistSong.count') do
      post setlist_songs_url, params: { setlist_song: {  } }
    end

    assert_redirected_to setlist_song_url(SetlistSong.last)
  end

  test "should show setlist_song" do
    get setlist_song_url(@setlist_song)
    assert_response :success
  end

  test "should get edit" do
    get edit_setlist_song_url(@setlist_song)
    assert_response :success
  end

  test "should update setlist_song" do
    patch setlist_song_url(@setlist_song), params: { setlist_song: {  } }
    assert_redirected_to setlist_song_url(@setlist_song)
  end

  test "should destroy setlist_song" do
    assert_difference('SetlistSong.count', -1) do
      delete setlist_song_url(@setlist_song)
    end

    assert_redirected_to setlist_songs_url
  end
end
