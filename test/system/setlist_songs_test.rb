require "application_system_test_case"

class SetlistSongsTest < ApplicationSystemTestCase
  setup do
    @setlist_song = setlist_songs(:one)
  end

  test "visiting the index" do
    visit setlist_songs_url
    assert_selector "h1", text: "Setlist Songs"
  end

  test "creating a Setlist song" do
    visit setlist_songs_url
    click_on "New Setlist Song"

    click_on "Create Setlist song"

    assert_text "Setlist song was successfully created"
    click_on "Back"
  end

  test "updating a Setlist song" do
    visit setlist_songs_url
    click_on "Edit", match: :first

    click_on "Update Setlist song"

    assert_text "Setlist song was successfully updated"
    click_on "Back"
  end

  test "destroying a Setlist song" do
    visit setlist_songs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Setlist song was successfully destroyed"
  end
end
