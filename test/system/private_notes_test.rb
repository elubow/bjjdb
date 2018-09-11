require "application_system_test_case"

class PrivateNotesTest < ApplicationSystemTestCase
  setup do
    @private_note = private_notes(:one)
  end

  test "visiting the index" do
    visit private_notes_url
    assert_selector "h1", text: "Private Notes"
  end

  test "creating a Private note" do
    visit private_notes_url
    click_on "New Private Note"

    fill_in "Body", with: @private_note.body
    fill_in "Link", with: @private_note.link_id
    fill_in "Title", with: @private_note.title
    fill_in "User", with: @private_note.user_id
    click_on "Create Private note"

    assert_text "Private note was successfully created"
    click_on "Back"
  end

  test "updating a Private note" do
    visit private_notes_url
    click_on "Edit", match: :first

    fill_in "Body", with: @private_note.body
    fill_in "Link", with: @private_note.link_id
    fill_in "Title", with: @private_note.title
    fill_in "User", with: @private_note.user_id
    click_on "Update Private note"

    assert_text "Private note was successfully updated"
    click_on "Back"
  end

  test "destroying a Private note" do
    visit private_notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Private note was successfully destroyed"
  end
end
