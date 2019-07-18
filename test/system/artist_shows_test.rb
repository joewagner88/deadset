require "application_system_test_case"

class ArtistShowsTest < ApplicationSystemTestCase
  setup do
    @artist_show = artist_shows(:one)
  end

  test "visiting the index" do
    visit artist_shows_url
    assert_selector "h1", text: "Artist Shows"
  end

  test "creating a Artist show" do
    visit artist_shows_url
    click_on "New Artist Show"

    click_on "Create Artist show"

    assert_text "Artist show was successfully created"
    click_on "Back"
  end

  test "updating a Artist show" do
    visit artist_shows_url
    click_on "Edit", match: :first

    click_on "Update Artist show"

    assert_text "Artist show was successfully updated"
    click_on "Back"
  end

  test "destroying a Artist show" do
    visit artist_shows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artist show was successfully destroyed"
  end
end
